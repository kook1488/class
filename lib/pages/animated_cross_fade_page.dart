import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({super.key});

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("두개의 위젯 전환 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedCrossFade(
              //사라지면서 면환된다
              firstChild: Align(
                alignment: Alignment.topCenter,

                child: Container(
                  alignment: Alignment.bottomLeft,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.deepOrange,
                  ),
                  child: const Text(
                    "첫번째 자식",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              secondChild: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                  ),
                  child: const Text(
                    "두번째 자식",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              crossFadeState: isAnimated
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 2)),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
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
