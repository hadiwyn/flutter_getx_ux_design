import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddDataKehilanganController extends GetxController {
  late TextEditingController nama_barangC;
  late TextEditingController nama_pengaduC;
  late TextEditingController no_tlpC;
  late TextEditingController deskripsiC;
  late TextEditingController keyC;
  late TextEditingController imgC;
  late String imgUrl = "";
  late XFile? imgFile;

  DatabaseReference? dbRef;

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imgFile = image;
      imgC.text = image.name;
    }

    String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference ref = FirebaseStorage.instance.ref().child("images");
    Reference uploadImg = ref.child(uniqueName);

    try {
      await uploadImg.putFile(File(image!.path));
      imgUrl = await uploadImg.getDownloadURL();
    } catch (error) {}
  }

  void addAduanKehilangan(String nama_barang, String nama_pengadu,
      String no_tlp, String deskripsi, XFile image, String key) {
    String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

    try {
      String dateNow = DateTime.now().toIso8601String();

      Map<String, String> Data_Kehilangan = {
        "nama_barang": nama_barang,
        "nama_pengadu": nama_pengadu,
        "no_tlp": no_tlp,
        "image": imgUrl,
        "deskripsi": deskripsi,
        "key_validasi": key,
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
    imgC = TextEditingController();
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
