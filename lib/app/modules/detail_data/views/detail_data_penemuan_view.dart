import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_data_controller.dart';

// ignore: must_be_immutable
class DetailDataPenemuanView extends GetView<DetailDataController> {
  var Data;

  DetailDataPenemuanView(this.Data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Barang Ditemukan'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 330,
            height: 500,
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
              Spacer(),
              Text(
                Data["nama_barang"],
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              Spacer(),
              Container(
                width: 280,
                height: 150,
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
                child: Center(
                  child: Text("Disini Ada Foto YAAA"),
                ),
              ),
              Spacer(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "Keterangan Singkat",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 280,
                height: 150,
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    Data["keterangan"],
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  whatsApp();
                },
                child: Container(
                  width: 150,
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
                  child: Center(
                      child: Text(
                    "Chat Lewat WA",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  )),
                ),
              ),
              Spacer()
            ]),
          ),
        ));
  }
  whatsApp() {
    return launchUrl(
      Uri.parse(
        // 'https://wa.me/${Data["no_tlp"]}' //you use this url also
        'whatsapp://send?phone=${Data["no_tlp"]}', //put your number here
      ),
    );
  }
}
