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
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        // ignore: prefer_const_constructors
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
            SizedBox(height: 500, child: ListData())
          ],
        )));
  }
}
