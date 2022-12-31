import 'package:get/get.dart';

import '../controllers/add_data_kehilangan_controller.dart';

class AddDataKehilanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataKehilanganController>(
      () => AddDataKehilanganController(),
    );
  }
}
