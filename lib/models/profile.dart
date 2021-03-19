import 'package:get/get.dart';

class MyProfile extends GetxController {
  RxString name = "User".obs;
  RxString id = "id".obs;
  RxString email = "email".obs;
  RxBool verified = false.obs;
  RxString image = "url".obs;
  RxBool isFemale = false.obs;
  RxString city = "City".obs;
  RxString state = "State".obs;
  RxString country = "Country".obs;
  

}
