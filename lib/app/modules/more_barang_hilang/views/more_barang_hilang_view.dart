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
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 20, right: 15, left: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  initialValue: null,
                                  decoration: InputDecoration.collapsed(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: "What are you craving?",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                    hoverColor: Colors.transparent,
                                  ),
                                  onFieldSubmitted: (value) {},
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
