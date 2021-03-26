import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/chatModel.dart';
import 'package:Huddle/screens/holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyChatScreen extends StatefulWidget {
  final ChatData obj;
  const MyChatScreen({Key key, this.obj}) : super(key: key);
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final firestore = FirebaseFirestore.instance;
  Widget myMessage(String from, String message, String time) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              color: Colors.blue[400],
              padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.off(() => AllChats());
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.obj.userImage.toString()),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  BoldText(
                      text: widget.obj.userName.toString(),
                      color: Colors.white,
                      size: 16),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: firestore
                  .collection('users')
                  .orderBy("time")
                  .limit(500)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final text = snapshot.data.docs;
                  List<Widget> allConf = [];
                  for (var confession in text) {
                    final from = confession.get('from');
                    final message = confession.get('message');
                    final time = confession.get('time');
                    Widget temp = myMessage(from, message, time);
                    allConf.add(temp);
                  }
                  return Expanded(
                    child: ListView(
                      addRepaintBoundaries: true,
                      shrinkWrap: true,
                      children: allConf,
                    ),
                  );
                } else
                  return Expanded(
                    child: Container(
                      child: Text("No Chats Found"),
                    ),
                  );
              },
            ),
            Container(
              height: 80,
              padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Message",
                        prefixIcon: Icon(Icons.message_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
