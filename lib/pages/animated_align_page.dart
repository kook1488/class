import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("정렬 전환 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedAlign(//positioned 와 다른게 positioned는 숫자 정확히 찍어줘야하지만
            //alignment 는 끝으로 정확히 한번에 보내준다 positioned가 숫자 기종마다 다를수도 있고
            //정확히 하려고 너무 여러번 찍어야 할 수도 있다
            alignment: isAnimated ? Alignment.bottomLeft : Alignment.topRight,
            duration: const Duration(seconds: 2),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
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