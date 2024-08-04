import 'package:flutter/material.dart';
import 'package:histudy/routers.dart';
//st에 클래스명, 그리고 3쨰줄 뒤에 et 지웠다 써서 import 하기

void main() {
  runApp(const AnimationStudy());
}

class AnimationStudy extends StatelessWidget{
  const AnimationStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
    );
  }
}

// 버튼 클릭시 소리와 클릭한거처럼 깜박임 구현
// 페이지 전환시 옆으로 빠르게 넘어가도록 구현 뒤로가기와 들어가기는 다른 소리로