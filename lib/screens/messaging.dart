import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/messageIndex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messaging extends StatelessWidget {
  final indexController = Get.put(MessageIndex());
  Widget chatbox(String image, String name, String lastmsg, String time) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: ShadowBoldText(
                color: Colors.black,
                text: "Message",
                size: 60,
              )),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            height: 100,
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      child: Obx(
                    () => ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: (indexController.index.value == 0)
                            ? MaterialStateProperty.all<Color>(Colors.white)
                            : MaterialStateProperty.all<Color>(Colors.grey[300]),
                      ),
                      onPressed: () {
                        indexController.index.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: BoldText(
                            text: "Chats", color: Colors.black, size: 20),
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  width: 10,
                  
                ),
               Expanded(
                  child: Container(
                      child: Obx(
                    () => ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: (indexController.index.value == 1)
                            ? MaterialStateProperty.all<Color>(Colors.white)
                            : MaterialStateProperty.all<Color>(Colors.grey[300]),
                      ),
                      onPressed: () {
                        indexController.index.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: BoldText(
                            text: "Find", color: Colors.black, size: 20),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [],
          ),
        ],
      ),
    );
  }
}
