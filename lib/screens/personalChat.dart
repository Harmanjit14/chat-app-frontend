import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/chatModel.dart';
import 'package:Huddle/screens/holder.dart';
import 'package:Huddle/server/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(15),
            child: RegularText(
              text: message,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RegularText(
                  text: time.toString(), color: Colors.grey, size: 12)),
        ],
      ),
    );
  }

  Widget otherMessage(String from, String message, String time) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(15),
            child: RegularText(
              text: message,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RegularText(
                  text: time.toString(), color: Colors.grey, size: 12)),
        ],
      ),
    );
  }

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
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
                  .collection(widget.obj.collection.toString())
                  .orderBy("time", descending: true)
                  .limit(500)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.isBlank) {
                  return Expanded(
                    child: Container(
                      child: Text("No Chats Found"),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final text = snapshot.data.docs;
                  List<Widget> allConf = [];
                  for (var confession in text) {
                    final from = confession.get('from');
                    final message = confession.get('message');
                    final time = confession.get('when');
                    if (from.toString() == profile.id.value.toString()) {
                      Widget temp = otherMessage(from, message, time);
                      allConf.add(temp);
                    } else {
                      Widget temp = myMessage(from, message, time);
                      allConf.add(temp);
                    }
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      addRepaintBoundaries: true,
                      shrinkWrap: true,
                      children: allConf,
                    ),
                  );
                } else
                  return Expanded(
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.blue,
                      ),
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
                      controller: controller,
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
                    onPressed: () {
                      Map<String, String> map = {
                        "from": profile.id.value,
                        "message": message,
                        "time": "${DateTime.now().microsecondsSinceEpoch}",
                        "when":
                            DateFormat.jm().format(DateTime.now()).toString(),
                      };
                      if (message != null && message != "") {
                        firestore
                            .collection(widget.obj.collection.toString())
                            .add(map);
                        setState(() {
                          controller.clear();
                        });
                      }
                    },
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
