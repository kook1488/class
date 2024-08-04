import 'package:flutter/material.dart';

class AnimatedDefaultTextstylePage extends StatefulWidget {
  const AnimatedDefaultTextstylePage({super.key});

  @override
  State<AnimatedDefaultTextstylePage> createState() =>
      _AnimatedDefaultTextstylePageState();
}

class _AnimatedDefaultTextstylePageState
    extends State<AnimatedDefaultTextstylePage> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//앱바 안드로이드 스튜디오에서 제시한거는 뒤로가기 있다 푸쉬팝으로
        title: const Text("텍스트 스타일 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(//바깥부분 왜 패딩 또 쓰지?? 안에만 여백때문에 필요한거 아냐?
            padding: const EdgeInsets.only(top: 200.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  color: isAnimated ? Colors.blue : Colors.green,
                  fontSize: isAnimated ? 30 : 70,
                  fontWeight: isAnimated ? FontWeight.normal : FontWeight.bold,
                ),
                child: Text("테슬라"),
                duration: Duration(seconds: 5),
              ),
            ),
          ),
          Padding(//only 쓴거는 top, left안쓰고 bottom만 써서 고려해준다는뜻
            padding: EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                //만들어진 기본효과로써 버튼 깜박임
                onPressed: () {
                  setState(() {
                    isAnimated = !isAnimated;
                  });
                },
                child: Text("Click"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//st에 클래스명, 그리고 3쨰줄 뒤에 et 지웠다 써서 import 하기
