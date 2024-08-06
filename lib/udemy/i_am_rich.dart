import 'package:flutter/material.dart';
//st에 클래스명, 그리고 3쨰줄 뒤에 et 지웠다 써서 import 하기

void main() {
  //스캐폴드 배경색 바꾸기
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            //Image를 누른 다음에 전구를 누르면 감싸기가 생긴다
            image: AssetImage('assets/images/diamond.png'),
            //URL가져오려면 새탭에서 이미지 열기 해서 그거를 가져와야 한다.
            //이미지를 새페이지에서 열기를 해야 가져올 수 있다
            // 옆에 화살표를 눌러서 축소시킬 수 있다.
          ),
        ),
      ),
    ),
  );
}
// ! asdasd
// 버튼 클릭시 소리와 클릭한거처럼 깜박임 구현
// 페이지 전환시 옆으로 빠르게 넘어가도록 구현 뒤로가기와 들어가기는 다른 소리로
