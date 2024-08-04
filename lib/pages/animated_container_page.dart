import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("컨테이너 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200), //숫자올릴수록 위에서 내려감
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isAnimated ? 100 : 300,  //불대수로 운영한다
                height: isAnimated ? 100 : 300,
                decoration: BoxDecoration(

                  borderRadius: isAnimated //밑에 isAnimated 불대수에 따라 원 깎음
                      ? BorderRadius.circular(0) : BorderRadius.circular(300),
                  color: isAnimated ? Colors.pink : Colors.amber,

                  boxShadow: isAnimated //밑에 isanimated 불대수에 따라 그림자 드리움
                    ? []
                    : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                        spreadRadius: 3,
                      )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),//밑에서 100,숫자 올릴수록 위로 올라감
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAnimated = !isAnimated;
                  });
                },
                child: const Text("Click!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}