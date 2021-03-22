import 'dart:async';

import 'package:Huddle/constants/text.dart';
import 'package:Huddle/screens/holder.dart';
import 'package:Huddle/screens/log_holder.dart';
import 'package:Huddle/server/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ButtonLogin extends GetxController {
  RxInt buttonState = 0.obs;
}

// ignore: must_be_immutable
class LoginSreen extends StatefulWidget {
  @override
  _LoginSreenState createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  String username = "";
  final TextEditingController uName = new TextEditingController();
  final TextEditingController uPassword = new TextEditingController();
  String password = "";
  bool uError = false;
  bool pError = false;
  final btnState = Get.put(ButtonLogin());
  @override
  void initState() {
    uName.addListener(() {
      username = uName.text;
    });
    uPassword.addListener(() {
      password = uPassword.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    uName.dispose();
    uPassword.dispose();
    super.dispose();
  }

  Widget logChild() {
    switch (btnState.buttonState.value) {
      case 0:
        {
          return Container(
            child: BoldText(text: "Continue", color: Colors.white, size: 20),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "LogIn",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {
                        Get.off(() => Login());
                      })
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: BoldText(
                text: "Let's sign you in.",
                size: 37,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: RegularText(
                text: "Welcome back.\nYou've been missed!",
                size: 28,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                controller: uName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: (uError) ? "Can't be empty!" : null,
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                controller: uPassword,
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  errorText: (pError) ? "Can't be empty" : null,
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Obx(() {
                    return ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      onPressed: () async {
                        if (password.isBlank && username.isBlank) {
                          setState(() {
                            pError = true;
                            uError = true;
                          });
                          Timer(Duration(seconds: 2), () {
                            setState(() {
                              uError = false;
                              pError = false;
                            });
                          });
                        } else if (username.isBlank) {
                          setState(() {
                            uError = true;
                          });

                          Timer(Duration(seconds: 2), () {
                            setState(() {
                              uError = false;
                              pError = false;
                            });
                          });
                        } else if (password.isBlank) {
                          setState(() {
                            pError = true;
                          });
                          Timer(Duration(seconds: 2), () {
                            setState(() {
                              uError = false;
                              pError = false;
                            });
                          });
                        } else {
                          btnState.buttonState.value = 0;
                          if (await login(username, password)) {
                            btnState.buttonState.value = 1;
                            Timer(Duration(seconds: 1), () {
                              Get.offAll(() => AllChats());
                            });
                          } else {
                            btnState.buttonState.value = 2;
                          }
                        }
                      },
                      child: Container(
                        child: logChild(),
                      ),
                    );
                  }),
                )),
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class Registerscreen extends StatelessWidget {
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {
                        Get.off(() => Login());
                      })
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: BoldText(
                text: "Sign up!",
                size: 37,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: RegularText(
                text: "Register yourself here.",
                size: 28,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  username = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.alternate_email_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    onPressed: () async {
                      Get.to(() => Profilescreen());
                      //TODO Harman yahaan button ki state management yaad rakhio...
                      // if (await login(username, password)) {
                      //   Get.offAll(() => AllChats());
                      // } else {
                      //   print("error");
                      // }
                    },
                    child: Container(
                      child:
                          BoldText(text: "Next", color: Colors.white, size: 20),
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class Profilescreen extends StatelessWidget {
  String name = "";
  String dropdownValue = "";
  String city = "";
  String state = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {
                        Get.off(() => Registerscreen());
                      })
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: BoldText(
                text: "Profile",
                size: 37,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: RegularText(
                text: "Build up your profile.",
                size: 28,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: DropdownButton(
                icon: const Icon(Icons.arrow_downward),
                onChanged: (value) {
                  if (value == 0) {
                    dropdownValue = 'M';
                  }
                  if (value == 1) {
                    dropdownValue = 'F';
                  }
                  if (value == 2) {
                    dropdownValue = 'O';
                  }
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "City",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  city = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "State",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  state = value;
                },
              ),
            ),
            Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    onPressed: () async {
                      //TODO Harman yahaan button ki state management yaad rakhio...
                      // if (await login(username, password)) {
                      //   Get.offAll(() => AllChats());
                      // } else {
                      //   print("error");
                      // }
                    },
                    child: Container(
                      child:
                          BoldText(text: "Save", color: Colors.white, size: 20),
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
