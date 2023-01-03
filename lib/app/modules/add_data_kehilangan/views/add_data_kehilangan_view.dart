import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_data_kehilangan_controller.dart';

class AddDataKehilanganView extends GetView<AddDataKehilanganController> {
  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  AddDataKehilanganView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Aduan Kehilangan',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF315F43),
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.blueGrey, //change your color here
          ),
          backgroundColor: Color.fromARGB(255, 239, 239, 239),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [content()],
            ),
          ),
        ));
  }

  Widget content() {
    return PhysicalModel(
        color: Colors.white,
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 610,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: controller.nama_barangC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.business_center_outlined),
                      hintText: 'masukkan nama barang',
                      labelText: 'Nama Barang',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]+$').hasMatch(value!)) {
                        return "masukkan nama barang yang benar";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: controller.nama_pengaduC,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'masukkan nama pengadu',
                      labelText: 'Nama Pengadu',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]+$').hasMatch(value!)) {
                        return "masukkan nama pengadu yang benar";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: controller.no_tlpC,
                    maxLength: 13,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: '62xxx',
                      labelText: 'Nomor Telepon',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?:[+62]62)?[0-9]{13}$')
                              .hasMatch(value!)) {
                        return "masukkan nomor telepon yang benar";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: TextFormField(
                      enabled: false,
                      readOnly: true,
                      controller: controller.imgC,
                      decoration: InputDecoration(
                        hintText: 'foto belum diupload',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xFF315F43)),
                        ),
                        onPressed: controller.getImage,
                        child: Text(
                          'Upload Foto',
                          textAlign: TextAlign.center,
                        )),
                  ),
                  TextFormField(
                    controller: controller.deskripsiC,
                    decoration: InputDecoration(
                      icon: Icon(Icons.description_outlined),
                      hintText: 'masukkan deskripsi',
                      labelText: 'Deskripsi',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]+$').hasMatch(value!)) {
                        return "masukkan deskripsi yang benar";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: controller.keyC,
                    decoration: InputDecoration(
                      icon: Icon(Icons.key_outlined),
                      hintText: 'digunakan untuk menghapus aduan',
                      labelText: 'Kunci Penghapusan',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]+$').hasMatch(value!)) {
                        return "masukkan kunci yang benar";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xFF315F43)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.addAduanKehilangan(
                                  controller.nama_barangC.text,
                                  controller.nama_pengaduC.text,
                                  controller.no_tlpC.text,
                                  controller.deskripsiC.text,
                                  controller.imgFile!,
                                  controller.keyC.text);
                            }
                          },
                          child: Text('Tambah')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
