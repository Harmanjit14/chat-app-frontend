import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';

class Messaging extends StatelessWidget {
  Widget chatbox(String image,String name, String lastmsg, String time){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Row(
          children: [
            Container(
              child: CircleAvatar(backgroundImage: AssetImage(image),),
            ),
            Expanded(
                          child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Column(
                  children: [
                    RegularText(text: name,color: Colors.black,size: 16,),
                    RegularText(text: lastmsg,color: Colors.black,size: 10,),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(time),
            ),
          ],
        ),
    );
  }
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
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
             child: Row(
               children: [
                 Expanded(
                   child: Container(
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                                            child: ElevatedButton(
                         style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                         onPressed: () {},
                         child: Container(
                           child: RegularText(text: "Latest",color: Colors.black, size: 15),
                         ),
                         ),
                     ),
                   ),
                   ),
                   SizedBox(width: 10,height: 60,),
                   Expanded(
                   child: Container(
                     child: ElevatedButton(
                       onPressed: () {},
                       child: Container(
                         child: RegularText(text: "Latest",color: Colors.black, size: 15,),
                       ),
                       ),
                   ),
                   ),
               ],
             ),
            ),
            ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                chatbox("assets/gurleen.jpeg", "Gurleen", "HI!", "15:57")
              ],
            ),
        ],
      ),
    );
  }
}
