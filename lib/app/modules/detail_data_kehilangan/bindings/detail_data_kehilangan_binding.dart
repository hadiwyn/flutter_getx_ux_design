import 'package:get/get.dart';

import '../controllers/detail_data_kehilangan_controller.dart';

class DetailDataKehilanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDataKehilanganController>(
      () => DetailDataKehilanganController(),
    );
  }
}
