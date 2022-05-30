import 'dart:async';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/user_route_processing.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit;
    splashScreenStart();
  }

  splashScreenStart() {
    Duration duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Get.off(() => UserRouteProcessing());
      },
    );
  }
}