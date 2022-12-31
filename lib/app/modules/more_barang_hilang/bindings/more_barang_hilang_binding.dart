import 'package:get/get.dart';

import '../controllers/more_barang_hilang_controller.dart';

class MoreBarangHilangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreBarangHilangController>(
      () => MoreBarangHilangController(),
    );
  }
}
