import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("위치 전환 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: isAnimated ? 0 : 400,//width 의 200만큼 빼준거 그러면 딱 맞다
            left: isAnimated ? 0 : MediaQuery.of(context).size.width - 200,
            duration: const Duration(seconds: 2),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.orange,
            ),
          ),
          AnimatedPositioned(
            top: isAnimated ? 0 : 400,
            left: !isAnimated ? 0 : MediaQuery.of(context).size.width - 200,
            duration: const Duration(seconds: 2),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
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