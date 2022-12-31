import 'package:get/get.dart';

import '../controllers/add_data_penemuan_controller.dart';

class AddDataPenemuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataPenemuanController>(
      () => AddDataPenemuanController(),
    );
  }
}
