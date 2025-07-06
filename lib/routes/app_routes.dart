import 'package:get/get.dart';
import '../views/welcome_screen.dart';
import '../views/login_screen.dart';
import '../views/create_account_screen.dart';
import '../views/device_pairing_screen.dart';

import '../controllers/welcome_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/create_account_controller.dart';
import '../controllers/device_pairing_controller.dart';


class AppRoutes {
  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => const WelcomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WelcomeController());
      }),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: '/create-account',
      page: () => const CreateAccountScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CreateAccountController());
      }),
    ),
    GetPage(
      name: '/device-pairing',
      page: () => const DevicePairingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DevicePairingController());
      }),
    ),
  ];
}
