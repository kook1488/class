import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  State<AnimatedSwitcherPage> createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int isAnimated = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("여러 위젯 전환 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: isAnimated == 1
                ? Center(
              key: const ValueKey<int>(1),
              child: Container(
                width: 300,
                height: 150,
                color: Colors.indigo,
              ),
            )
                : isAnimated == 2
                ? Center(
              key: const ValueKey<int>(2),
              child: Container(
                width: 150,
                height: 300,
                color: Colors.teal,
              ),
            )
                : Center(
              key: const ValueKey<int>(3),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
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
                    if (isAnimated == 1) {
                      isAnimated = 2;
                    } else if (isAnimated == 2) {
                      isAnimated = 3;
                    } else {
                      isAnimated = 1;
                    }
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