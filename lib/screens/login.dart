import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLogin extends GetxController {
  RxInt buttonState = 0.obs;
}

class LoginSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            ),
          )
        ],
      )),
    );
  }
}
