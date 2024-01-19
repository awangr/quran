import 'package:get/get.dart';

import '../controllers/homequran_controller.dart';

class HomequranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomequranController>(
      () => HomequranController(),
    );
  }
}
