import 'package:get/get.dart';

import '../controllers/introquran_controller.dart';

class IntroquranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroquranController>(
      () => IntroquranController(),
    );
  }
}
