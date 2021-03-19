import 'package:Huddle/constants/text.dart';
import 'package:Huddle/screens/holder.dart';
import 'package:Huddle/screens/log_holder.dart';
import 'package:Huddle/server/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLogin extends GetxController {
  RxInt buttonState = 0.obs;
}

class LoginSreen extends StatelessWidget {
   String username = "";
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value){
                  username=value;
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
                onChanged: (value){
                  password=value;
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
                    onPressed: () async{
                     
                      //TODO Harman yahaan button ki state management yaad rakhio...
                      if(await login(username, password)){
                      Get.offAll(AllChats());
                      }
                      else{
                        print("error");
                      }
                    },
                    child: Container(
                      child: BoldText(
                          text: "Continue", color: Colors.white, size: 20),
                    ),
                  ),
                )),
        ],
      ),
          )),
    );
  }
}
