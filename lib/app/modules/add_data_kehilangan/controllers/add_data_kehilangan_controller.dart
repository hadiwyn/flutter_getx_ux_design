import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddDataKehilanganController extends GetxController {
  late TextEditingController nama_barangC;
  late TextEditingController nama_pengaduC;
  late TextEditingController no_tlpC;
  late TextEditingController deskripsiC;
  late TextEditingController keyC;

  DatabaseReference? dbRef;

  void addAduanKehilangan(String nama_barang, String nama_pengadu,
      String no_tlp, String deskripsi, String key) {

    String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

    try {
      String dateNow = DateTime.now().toIso8601String();

      Map<String, String> Data_Kehilangan = {
        "nama_barang": nama_barang,
        "nama_pengadu": nama_pengadu,
        "no_tlp": no_tlp,
        "deskripsi": deskripsi,
        "key": key,
        "date": cdate2
      };

      dbRef?.push().set(Data_Kehilangan);

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan Aduan",
        onConfirm: () {
          nama_barangC.clear();
          nama_pengaduC.clear();
          no_tlpC.clear();
          deskripsiC.clear();
          keyC.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "Okey",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Dapat Menambahkan Data",
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    nama_barangC = TextEditingController();
    nama_pengaduC = TextEditingController();
    no_tlpC = TextEditingController();
    deskripsiC = TextEditingController();
    keyC = TextEditingController();
    dbRef;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    dbRef = FirebaseDatabase.instance.ref().child('Data_Kehilangan');
  }

  @override
  void onClose() {
    nama_barangC.dispose();
    nama_pengaduC.dispose();
    no_tlpC.dispose();
    deskripsiC.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
