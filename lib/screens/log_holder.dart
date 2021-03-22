import 'package:Huddle/constants/text.dart';
import 'package:Huddle/screens/holder.dart';
import 'package:Huddle/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height * 0.45,
            child: Image.asset(
              "assets/login.gif",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ShadowBoldText(
                    text: "Huddle",
                    size: 60,
                    color: Colors.black,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: RegularText(
                      text:
                          "Bring together your friends, relatives and others"),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[700]),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => Registerscreen(),
                            transition: Transition.native);
                      },
                      child: BoldText(
                        text: "SignUp",
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => LoginSreen(),
                            transition: Transition.native);
                      },
                      child: BoldText(
                        text: "SignIn",
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
