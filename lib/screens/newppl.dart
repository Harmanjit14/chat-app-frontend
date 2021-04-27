import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';

class FindPeople extends StatefulWidget {
  @override
  _FindPeopleState createState() => _FindPeopleState();
}

class _FindPeopleState extends State<FindPeople> {
  final controller = TextEditingController();
  String message = "";
  @override
  void initState() {
    controller.addListener(() {
      message = controller.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search here..",
                  prefixIcon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[700],
                  ),
                  SizedBox(width: 10),
                  RegularText(
                    
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
