import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_data_kehilangan_controller.dart';

class AddDataKehilanganView extends GetView<AddDataKehilanganController> {
  const AddDataKehilanganView({Key? key}) : super(key: key);

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
          height: 550,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: controller.nama_barangC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Nama Barang',
                ),
              ),
              TextFormField(
                controller: controller.nama_pengaduC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Nama Pengadu',
                ),
              ),
              TextFormField(
                controller: controller.no_tlpC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: '62xxx',
                  labelText: 'Nomor Telepon',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Foto Barang',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Upload Foto')),
              TextFormField(
                controller: controller.deskripsiC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Deskripsi',
                ),
              ),
              TextFormField(
                controller: controller.keyC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Digunakan untuk menghapus aduan',
                  labelText: 'Kunci Penghapusan',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.addAduanKehilangan(
                            controller.nama_barangC.text,
                            controller.nama_pengaduC.text,
                            controller.no_tlpC.text,
                            controller.deskripsiC.text,
                            controller.keyC.text);
                      },
                      child: Text('Tambah')),
                ],
              )
            ],
          ),
        ));
  }
}
