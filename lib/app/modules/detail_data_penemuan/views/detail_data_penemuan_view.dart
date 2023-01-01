import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_data_penemuan_controller.dart';

class DetailDataPenemuanView extends GetView<DetailDataPenemuanController> {
  var Data;
  var Reference;
  var kunci_penghapusan;
  var validasi;

  DetailDataPenemuanView(this.Data, this.Reference, {super.key});

  TextEditingController kunci = TextEditingController();

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
                  // ignore: prefer_const_constructors
                  child: Center(
                      // ignore: prefer_const_constructors
                      child: Text(
                    "Chat Lewat WA",
                    // ignore: prefer_const_constructors
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
      Reference.child(Data['key']).remove();
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
