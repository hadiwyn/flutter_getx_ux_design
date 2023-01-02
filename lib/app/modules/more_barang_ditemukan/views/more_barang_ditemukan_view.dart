import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ux/app/modules/more_barang_ditemukan/widget/list_data.dart';

import 'package:get/get.dart';

import '../controllers/more_barang_ditemukan_controller.dart';

class MoreBarangDitemukanView extends GetView<MoreBarangDitemukanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blueGrey, //change your color here
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: Text(
            "Barang Ditemukan",
            style: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [SizedBox(height: 633, child: ListData())],
                ))));
  }
}
