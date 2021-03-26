import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/chatModel.dart';
import 'package:Huddle/models/messageIndex.dart';
import 'package:Huddle/screens/personalChat.dart';
import 'package:Huddle/server/getChats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messaging extends StatelessWidget {
  final indexController = Get.put(MessageIndex());
  Widget chatbox(
      String image, String name, String lastmsg, String time, ChatData obj) {
    return Container(
      height: 70,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: InkWell(
        onTap: () {
          Get.to(() => MyChatScreen(
                obj: obj,
              ));
        },
        child: Container(
          child: Row(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image.toString()),
                  radius: 30,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        text: name,
                        color: Colors.black,
                        size: 20,
                      ),
                      RegularText(
                        text: lastmsg,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(time),
              ),
            ],
          ),
        ),
      ),
    );
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
                size: 40,
              )),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            height: 80,
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
                            : MaterialStateProperty.all<Color>(
                                Colors.grey[300]),
                      ),
                      onPressed: () {
                        indexController.index.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: BoldText(
                            text: "Chats", color: Colors.black, size: 16),
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
                            : MaterialStateProperty.all<Color>(
                                Colors.grey[300]),
                      ),
                      onPressed: () {
                        indexController.index.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: BoldText(
                            text: "Find", color: Colors.black, size: 16),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
          (chats.isEmpty)
              ? Container(
                  child: BoldText(
                    text: "Empty",
                  ),
                )
              : ListView.builder(
                  itemCount: chats.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return chatbox(
                        chats[index].userImage.toString(),
                        chats[index].userName.toString(),
                        "last message will come here",
                        "8:00pm",
                        chats[index]);
                  },
                ),
        ],
      ),
    );
  }
}
