import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';

class FindPeople extends StatefulWidget {
  @override
  _FindPeopleState createState() => _FindPeopleState();
}

class _FindPeopleState extends State<FindPeople> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: ShadowBoldText(
                text: "Find Friends",
                color: Colors.black,
                size: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
