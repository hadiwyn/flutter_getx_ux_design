import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddDataPenemuanController extends GetxController {
  late TextEditingController nama_barangC;
  late TextEditingController nama_penemuC;
  late TextEditingController no_tlpC;
  late TextEditingController keteranganC;
  late TextEditingController keyC;

  DatabaseReference? dbRef;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addAduanPenemuan(String nama_barang, String nama_penemu, String no_tlp, String keterangan,
      String key,) {
    String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

    try {
      String dateNow = DateTime.now().toIso8601String();

      Map<String, String> Data_Penemuan = {
        "nama_barang": nama_barang,
        "nama_penemu": nama_penemu,
        "no_tlp": no_tlp,
        "keterangan": keterangan,
        "key_validasi": key,
        "date": cdate2
      };

      dbRef?.push().set(Data_Penemuan);

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan Aduan",
        onConfirm: () {
          nama_barangC.clear();
          nama_penemuC.clear();
          no_tlpC.clear();
          keteranganC.clear();
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
    nama_penemuC = TextEditingController();
    no_tlpC = TextEditingController();
    keteranganC = TextEditingController();
    keyC = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    dbRef = FirebaseDatabase.instance.ref().child('Data_Penemuan');
  }

  @override
  void onClose() {
    nama_barangC.dispose();
    nama_penemuC.dispose();
    no_tlpC.dispose();
    keteranganC.dispose();
    keyC.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
