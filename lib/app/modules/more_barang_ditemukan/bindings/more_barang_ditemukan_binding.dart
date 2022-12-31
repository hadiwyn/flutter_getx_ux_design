import 'package:get/get.dart';

import '../controllers/more_barang_ditemukan_controller.dart';

class MoreBarangDitemukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreBarangDitemukanController>(
      () => MoreBarangDitemukanController(),
    );
  }
}
