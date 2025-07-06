import 'package:get/get.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/login'); 
    });
  }
}
