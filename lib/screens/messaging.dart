import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';

class Messaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: ShadowBoldText(color: Colors.black,text: "Message",size: 40,)
            ),
            
        ],
      ),
    );
  }
}
