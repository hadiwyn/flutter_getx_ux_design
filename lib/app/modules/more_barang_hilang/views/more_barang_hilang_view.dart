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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          width: 355,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x34000000),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.blueGrey),
                                  child: Icon(Icons.search),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 633, child: ListData())
                ],
              ))),
    );
  }
}
