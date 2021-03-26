import 'package:Huddle/models/chatModel.dart';
import 'package:flutter/material.dart';

class MyChatScreen extends StatefulWidget {
  final ChatData obj;

  const MyChatScreen({Key key, this.obj}) : super(key: key);
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.green,
          ),
          Expanded(
              child: ListView(
            children: [
              Text("hi"),
            ],
          )),
          Container(
            height: 100,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
