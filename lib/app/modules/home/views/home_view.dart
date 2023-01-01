import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ux/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';
import '../widget/add_data.dart';
import '../widget/list_horizontal.dart';
import '../widget/list_vertical.dart';

class HomeView extends GetView<HomeController> {
  final _selectedIndexNotifier = ValueNotifier<int>(0);

  final _pageController = PageController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Query dbRef = FirebaseDatabase.instance.ref().child('Data_Kehilangan');
  //DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang Di",
                      style: GoogleFonts.glory(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xFF315F43)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find My Stuff",
                    style: GoogleFonts.glory(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF315F43)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Barang Ditemukan",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFF4C874F),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.MORE_BARANG_DITEMUKAN),
                    child: Text(
                      "Lihat semua >",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF4C874F),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(height: 330, child: ListHorizontal()),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Barang Hilang",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFF4C874F),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.MORE_BARANG_HILANG),
                    child: Text(
                      "Lihat semua >",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF4C874F),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            SizedBox(height: 500, child: ListVertical())
          ]),
        ),
      ),
      floatingActionButton: Visibility(
          visible: true,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddData()),
              );
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
