import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("애니메이션 효과 학습"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedTextstyle");
                  },
                  child: const Text("AnimatedDefaultTextStyle"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedContainer");
                  },
                  child: const Text("AnimatedContainer"),
                ),
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedOpacity");
                  },
                  child: const Text("animatedOpacity"),
                ),
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedPositioned");
                  },
                  child: const Text("animatedPositioned"),
                ),
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedAlign");
                  },
                  child: const Text("animatedAlign"),
                ),
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedCrossFade");
                  },
                  child: const Text("animatedCrossFade"),
                ),
                const SizedBox(
                  height: 31,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("animatedSwitcher");
                  },
                  child: const Text("animatedSwitcher"),
                ),
                const SizedBox(
                  height: 31,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed("hero");
                  },
                  child: Hero(
                    tag: "hero-tag",
                    child: Image.network(
                      "https://goyang.s3.ap-northeast-2.amazonaws.com/images/banner.png",
                      width: 350,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
