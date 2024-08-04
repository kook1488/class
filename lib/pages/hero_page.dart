import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HORO 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
            tag: "hero-tag", //두 화면의 연결고리
            child: Image.network(
              "https://goyang.s3.ap-northeast-2.amazonaws.com/images/banner.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "마세라티 사실분!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("1억에 팝니다."),
        ],
      )),
    );
  }
}
