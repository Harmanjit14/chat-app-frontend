
import 'package:Huddle/screens/messaging.dart';
import 'package:Huddle/screens/newppl.dart';
import 'package:Huddle/screens/settings.dart';
import 'package:flutter/material.dart';

class AllChats extends StatefulWidget {
  @override
  _AllChatsState createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  final PageController controller = new PageController();
  int page = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: page,
          onTap: (value) {
            setState(() {
              page = value;
            });
            controller.animateToPage(page,
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Find",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          Messaging(),
          FindPeople(),
          Profile(),
        ],
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}
