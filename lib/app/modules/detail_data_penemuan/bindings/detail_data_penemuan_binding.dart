import 'package:get/get.dart';

import '../controllers/detail_data_penemuan_controller.dart';

class DetailDataPenemuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDataPenemuanController>(
      () => DetailDataPenemuanController(),
    );
  }
}
