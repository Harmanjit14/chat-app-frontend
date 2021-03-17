import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';

class Messaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: ShadowBoldText(color: Colors.black,text: "Message",size: 40,)
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
             child: Row(
               children: [
                 Expanded(
                   child: Container(
                     child: ElevatedButton(
                       onPressed: () {},
                       child: Container(
                         child: RegularText(text: "Latest",color: Colors.black, size: 20,),
                       ),
                       ),
                   ),
                   )
               ],
             ),
            ),
        ],
      ),
    );
  }
}
