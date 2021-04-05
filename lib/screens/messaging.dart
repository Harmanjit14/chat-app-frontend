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
      height: 65,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
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
                  radius: 26,
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
                        size: 18,
                      ),
                      RegularText(
                        text: lastmsg,
                        color: Colors.black,
                        size: 13,
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
              margin: EdgeInsets.fromLTRB(20, 30, 0, 20),
              child: ShadowBoldText(
                color: Colors.black,
                text: "Messages",
                size: 40,
              )),
          
          (chats.isEmpty)
              ? Center(
                child: Container(
                    child: BoldText(
                      text: "No chats found!\nFind friends to start conversations...",
                    ),
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
