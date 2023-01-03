import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_barang_hilang_controller.dart';
import '../widget/list_data.dart';

class MoreBarangHilangView extends GetView<MoreBarangHilangController> {
  const MoreBarangHilangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueGrey, //change your color here
        ),
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        elevation: 0,
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
          "Barang Dicari",
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
              ))),
    );
  }
}
