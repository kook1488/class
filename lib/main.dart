import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
  );
}

//나만의 위젯 만들기  여러 위젯을 하나의 위젯으로 묶음
//빌드함수를 반환하면 나오는게 홈스크린 위젯이다
//stateless 위젯을 선언하면 빌드함수에 있는
// 위젯들을 그대로 가져온다 => 홈화면 따로 구성해주기
//위젯 타입을 반환하는 빌드함수가 생김

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF335CB0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cf/logo.png',
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    ); //반환의 끝은 세미콜론
  }
}
