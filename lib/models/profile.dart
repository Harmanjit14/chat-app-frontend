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
  
  get getName => this.name;

  set setName(name) => this.name = name;

  get getId => this.id;

  set setId(id) => this.id = id;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getVerified => this.verified;

  set setVerified(verified) => this.verified = verified;

  get getImage => this.image;

  set setImage(image) => this.image = image;
}
