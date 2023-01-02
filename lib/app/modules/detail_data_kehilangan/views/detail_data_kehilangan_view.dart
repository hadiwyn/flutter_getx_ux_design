// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_data_kehilangan_controller.dart';

class DetailDataKehilanganView extends GetView<DetailDataKehilanganController> {
  var Data;
  var reference;
  var kunci_penghapusan;
  var validasi;

  DetailDataKehilanganView(this.Data, this.reference, {super.key});

  TextEditingController kunci = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
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
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  children: [
                    Text(
                      Data["nama_barang"],
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            // isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (contexy) => Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Hapus Data",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.only(),
                                        child: TextFormField(
                                          controller: kunci,
                                          maxLength: 20,
                                          decoration: const InputDecoration(
                                            labelText: 'Kunci Penghapusan',
                                            labelStyle: TextStyle(
                                              color: Colors.blueGrey,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            helperText:
                                                "Kunci penghapusan dibutuhkan",
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => rmData(),
                                        child: Container(
                                          width: 150,
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Hapus",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 24.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 280,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      Data['image'],
                    ).image,
                  ),
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
              ),
              Spacer(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "Deskripsi",
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
                    Data["deskripsi"],
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

  rmData() {
    kunci_penghapusan = kunci.text;
    validasi = Data['key_validasi'];
    print(kunci_penghapusan);
    print(validasi);
    if (kunci_penghapusan != validasi) {
      Get.defaultDialog(
          title: "Gagal",
          middleText: "Kunci penghapusan tidak sesuai",
          onConfirm: () {
            kunci.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Coba Lagi",
          confirmTextColor: Color.fromARGB(255, 255, 255, 255));
    } else {
      reference.child(Data['key']).remove();
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menghapus data",
        onConfirm: () {
          kunci.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "Oke",
      );
    }
  }
}
