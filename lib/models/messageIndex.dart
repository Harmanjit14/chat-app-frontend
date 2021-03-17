import 'package:get/get.dart';

class MessageIndex extends GetxController {
  RxInt index = 0.obs;
  RxInt get getIndex => this.index;

  set setIndex(RxInt index) => this.index = index;
}
