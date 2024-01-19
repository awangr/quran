import 'package:get/get.dart';

import '../controllers/terakhir_dibaca_controller.dart';

class TerakhirDibacaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TerakhirDibacaController>(
      () => TerakhirDibacaController(),
    );
  }
}
