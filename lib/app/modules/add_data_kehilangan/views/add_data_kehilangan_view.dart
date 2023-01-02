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
          // title: const Text('AddDataKehilanganView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [judul(), content()],
            ),
          ),
        ));
  }

  Widget judul() {
    return Container(
      alignment: Alignment.center,
      height: 75,
      child: Text(
        'Tambah Aduan Kehilangan',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
                      icon: Icon(Icons.person),
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
                      icon: Icon(Icons.person),
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
                  TextFormField(
                    decoration: InputDecoration(
                      enabled: false,
                      icon: Icon(Icons.person),
                      hintText: 'foto barang',
                      labelText: 'Foto Barang',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: controller.getImage,
                      child: Text('Upload Foto')),
                  TextFormField(
                    controller: controller.deskripsiC,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
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
                      icon: Icon(Icons.person),
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
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
