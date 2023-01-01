import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddDataPenemuanController extends GetxController {
  late TextEditingController nama_barangC;
  late TextEditingController nama_penemuC;
  late TextEditingController no_tlpC;
  late TextEditingController keteranganC;
  late TextEditingController keyC;
  late String imgUrl;

  late GlobalKey<FormState> addDataPenemuan = GlobalKey<FormState>();

  DatabaseReference? dbRef;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference ref = FirebaseStorage.instance.ref().child("images");
    Reference uploadImg = ref.child(uniqueName);

    try {
      await uploadImg.putFile(File(image!.path));
      imgUrl = await uploadImg.getDownloadURL();
    } catch (error) {}
  }

  void addAduanPenemuan(
    String nama_barang,
    String nama_penemu,
    String no_tlp,
    String? image,
    String keterangan,
    String key,
  ) {
    String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

    try {
      String dateNow = DateTime.now().toIso8601String();

      Map<String, String> Data_Penemuan = {
        "nama_barang": nama_barang,
        "nama_penemu": nama_penemu,
        "no_tlp": no_tlp,
        "keterangan": keterangan,
        "image": imgUrl,
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
