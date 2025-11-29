import 'package:flutter/material.dart';

class ScrollviewDemo extends StatefulWidget {
  const ScrollviewDemo({super.key});
  @override
  State<ScrollviewDemo> createState() => _ScrollviewDemoState();
}

class _ScrollviewDemoState extends State<ScrollviewDemo> {
  final ScrollController _scrollController = ScrollController();
  void scrollup() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.slowMiddle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          controller: _scrollController,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dignissim suspendisse in est ante in nibh mauris cursus mattis. Tincidunt vitae semper quis lectus nulla at volutpat. Netus et malesuada fames ac. In dictum non consectetur a erat nam at lectus. A scelerisque purus semper eget duis at tellus at urna. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Pretium lectus quam id leo in vitae turpis massa sed. Elementum facilisis leo vel fringilla est ullamcorper eget nulla facilisi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Nibh praesent tristique magna sit amet purus gravida quis blandit. Volutpat lacus laoreet non curabitur gravida arcu ac. Eu sem integer vitae justo eget magna fermentum. Tortor at risus viverra adipiscing at in tellus integer feugiat. Non sodales neque sodales ut etiam sit amet nisl. Cras fermentum odio eu feugiat pretium. Blandit massa enim nec dui nunc mattis enim ut tellus. Sagittis vitae et leo duis. Adipiscing commodo elit at imperdiet dui accumsan sit amet.',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'topBtn',
            onPressed: scrollup,
            backgroundColor: Colors.green,
            child: Icon(Icons.arrow_circle_up_sharp),
          ),
          FloatingActionButton(
            onPressed: scrollToBottom,
            backgroundColor: Colors.red,
            child: Icon(Icons.arrow_circle_down_sharp),
          ),
        ],
      ),
    );
  }
}
