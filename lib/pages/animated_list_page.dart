import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  bool isAnimated = true;
  TextEditingController controller = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<String> item = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("리스트 애니메이션"),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final int index = item.length;
                        if (controller.text.isNotEmpty) {
                          item.add(controller.text);
                          _listKey.currentState?.insertItem(index,
                              duration: const Duration(milliseconds: 300));
                          controller.clear();
                        }

                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: item.length,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.vertical,
                      child: Card(
                        child: ListTile(
                          title: Text(item[index]),
                          trailing: IconButton(
                            onPressed: () {
                              final String removedItem = item.removeAt(index);

                              _listKey.currentState?.removeItem(
                                index,
                                    (context, animation) => SizeTransition(
                                  sizeFactor: animation,
                                  axis: Axis.vertical,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(removedItem),
                                    ),
                                  ),
                                ),
                                duration: const Duration(milliseconds: 300),
                              );
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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