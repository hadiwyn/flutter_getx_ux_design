import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailDataPenemuanController extends GetxController {
  late TextEditingController kunci;

  void coba(String key) {
    print(key);
  }

  final count = 0.obs;
  @override
  void onInit() {
    kunci = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
