import 'package:flutter/material.dart';

class AllChats extends StatelessWidget {
  final PageController controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
