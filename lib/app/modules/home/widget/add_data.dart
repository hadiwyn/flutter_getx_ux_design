import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../routes/app_pages.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Layanan"),
        actions: const [],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 200,
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.ADD_DATA_KEHILANGAN);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
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
                    child: Center(child: Text("Tambah Data Kehilangan")),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.ADD_DATA_PENEMUAN);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
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
                    child: Center(child: Text("Tambah Data Penemuan")),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
