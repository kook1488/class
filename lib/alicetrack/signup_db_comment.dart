class DatabaseHelper {
  // DatabaseHelper 클래스 정의, 데이터베이스 관련 작업을 처리하는 클래스
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  // 싱글톤 패턴을 위한 프라이빗 정적 변수 _instance, 클래스 로드 시 초기화됨
  factory DatabaseHelper() => _instance;
  // 팩토리 생성자, 클래스 외부에서 호출 시 항상 동일한 인스턴스를 반환

  static Database? _database;
  // 프라이빗 정적 변수 _database, 데이터베이스 인스턴스를 저장하기 위한 변수 (초기에는 null)

  DatabaseHelper._internal();
// 프라이빗 생성자, 외부에서 직접 호출할 수 없으며 내부에서만 사용
}

// 비동기적으로 Database 인스턴스를 반환하는 게터
Future<Database> get database async {
  // 데이터베이스가 이미 초기화되어 있으면 (_database가 null이 아니면) 그 인스턴스를 반환
  if (_database != null) return _database!;

  // 데이터베이스가 초기화되지 않았으면 _initDatabase()를 호출하여 초기화
  _database = await _initDatabase();

  // 초기화된 Database 인스턴스를 반환
  return _database!;
}

// 데이터베이스를 초기화하고 파일 경로를 설정하는 메서드
Future<Database> _initDatabase() async {
  // 데이터베이스 파일의 경로를 설정 ('user_database.db'라는 이름으로 저장)
  String path = join(await getDatabasesPath(), 'user_database.db');

  // 지정된 경로에 데이터베이스를 열거나 없으면 생성, 버전은 1로 설정
  return await openDatabase(
    path,
    version: 1,
    // 데이터베이스가 처음 생성될 때 호출되는 콜백 함수로 _onCreate를 지정
    onCreate: _onCreate,
  );
}

// 데이터베이스가 처음 생성될 때 호출되는 콜백 함수, users 테이블을 생성
Future<void> _onCreate(Database db, int version) async {
  // SQL 명령어를 실행하여 users 테이블 생성
  await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      -- id 컬럼, 자동 증가하는 정수형 기본 키
      login_id TEXT UNIQUE,
      -- login_id 컬럼, 고유한 텍스트 값으로 설정
      nickname TEXT,
      -- nickname 컬럼, 텍스트 형태의 사용자 닉네임
      password TEXT,
      -- password 컬럼, 텍스트 형태의 해시된 비밀번호
      avatar_path TEXT
      -- avatar_path 컬럼, 텍스트 형태의 아바타 이미지 경로
    )
  ''');
}

// 비밀번호를 SHA-256 해시 알고리즘으로 해시화하는 메서드
String _hashPassword(String password) {
  // 비밀번호 문자열을 바이트 배열로 인코딩 (UTF-8 인코딩 사용)
  var bytes = utf8.encode(password);

  // 바이트 배열을 SHA-256 해시 알고리즘으로 해시화하여 digest 객체 생성
  var digest = sha256.convert(bytes);

  // 해시된 결과를 문자열로 변환하여 반환
  return digest.toString();
}

// 새로운 사용자를 데이터베이스에 삽입하는 메서드
Future<int> insertUser(Map<String, dynamic> user) async {
  // 비동기적으로 데이터베이스 인스턴스를 얻음
  Database db = await database;

  // 사용자의 비밀번호를 해시화하여 user 맵에 저장
  user['password'] = _hashPassword(user['password']);

  try {
    // users 테이블에 새로운 레코드를 삽입하고 삽입된 행의 ID를 반환
    return await db.insert('users', user);
  } catch (e) {
    // UNIQUE 제약 조건 위반(중복된 login_id) 예외 처리
    if (e.toString().contains('UNIQUE constraint failed')) {
      // 중복된 login_id가 있을 경우 예외 발생
      throw Exception('사용자 아이디가 이미 존재합니다.');
    } else {
      // 그 외의 예외 발생 시 예외를 다시 던짐
      throw e;
    }
  }
}

// 데이터베이스에서 모든 사용자 레코드를 조회하는 메서드
Future<List<Map<String, dynamic>>> getUsers() async {
  // 비동기적으로 데이터베이스 인스턴스를 얻음
  Database db = await database;

  // users 테이블의 모든 레코드를 조회하여 반환
  return await db.query('users');
}

// 특정 loginId와 password를 가진 사용자를 조회하는 메서드
Future<Map<String, dynamic>?> getUser(String loginId, String password) async {
  // 비동기적으로 데이터베이스 인스턴스를 얻음
  Database db = await database;

  // 입력된 비밀번호를 해시화
  String hashedPassword = _hashPassword(password);

  // users 테이블에서 login_id가 일치하는 레코드를 조회
  List<Map<String, dynamic>> results = await db.query(
    'users',
    where: 'login_id = ?',
    whereArgs: [loginId],
  );

  // 조회된 레코드가 있는지 확인
  if (results.isNotEmpty) {
    // 첫 번째 레코드를 가져옴
    Map<String, dynamic> user = results.first;

    // 데이터베이스에 저장된 해시된 비밀번호와 입력된 비밀번호를 비교
    if (user['password'] == hashedPassword) {
      // 비밀번호가 일치하면 해당 사용자 정보를 반환
      return {
        'id': user['id'],
        'login_id': user['login_id'],
        'nickname': user['nickname'],
        'avatar_path': user['avatar_path'],
      };
    }
  }
  // 사용자가 없거나 비밀번호가 일치하지 않으면 null을 반환
  return null;
}

// 사용자의 로그인 처리를 수행하는 메서드
Future<Map<String, dynamic>> loginUser(String loginId, String password) async {
  try {
    // 모든 비밀번호가 해시화되어 있는지 확인
    await ensurePasswordsAreHashed();

    // 입력된 loginId와 password로 사용자를 조회
    final user = await getUser(loginId, password);

    // 사용자가 존재하고 비밀번호가 일치하는 경우
    if (user != null) {
      // 로그인 성공 정보를 반환
      return {
        "success": true,
        "user": {
          "id": user['id'],
          "nickname": user['nickname'],
          "avatar_path": user['avatar_path'] ?? 'default_avatar.png',
        },
        "message": "로그인에 성공했습니다."
      };
    } else {
      // 로그인 실패 정보를 반환 (사용자 없음 또는 비밀번호 불일치)
      return {"success": false, "message": "아이디 또는 비밀번호가 올바르지 않습니다."};
    }
  } catch (e) {
    // 예외 발생 시 로그인 실패 정보를 반환
    return {"success": false, "message": "로그인 중 오류가 발생했습니다: $e"};
  }
}

// 모든 사용자 비밀번호가 해시화되어 있는지 확인하고 필요 시 업데이트하는 메서드
Future<void> ensurePasswordsAreHashed() async {
  // 비동기적으로 비밀번호 해시화를 확인 및 업데이트
  await updatePasswordToHash();
}

// 데이터베이스에 저장된 모든 사용자의 비밀번호를 해시화하는 메서드
Future<void> updatePasswordToHash() async {
  // 비동기적으로 데이터베이스 인스턴스를 얻음
  Database db = await database;

  // users 테이블의 모든 레코드를 조회
  List<Map<String, dynamic>> users = await db.query('users');

  // 각 사용자에 대해 비밀번호가 해시화되어 있는지 확인
  for (var user in users) {
    // SHA-256 해시는 64자이므로, 비밀번호가 해시화되지 않은 경우(길이가 64자가 아닌 경우)
    if (user['password'].length != 64) {
      // 비밀번호를 해시화
      String hashedPassword = _hashPassword(user['password']);

      // 해시화된 비밀번호로 업데이트
      await db.update(
        'users',
        {'password': hashedPassword},
        where: 'id = ?',
        whereArgs: [user['id']],
      );
    }
  }
}
