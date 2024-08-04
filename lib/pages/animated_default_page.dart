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
      appBar: AppBar(
        title: const Text("텍스트 스타일 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  color: isAnimated ? Colors.blue : Colors.green,
                  fontSize: isAnimated ? 30 : 50,
                  fontWeight: isAnimated ? FontWeight.normal : FontWeight.bold,
                ),
                duration: const Duration(seconds: 2),
                child: const Text("테슬라"),
              ),
            ),
          ),
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
