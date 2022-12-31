import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() {
    CollectionReference wisata = firestore.collection("Data_Penemuan");

    return wisata.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference wisata = firestore.collection("Data_Penemuan");
    return wisata.orderBy("time", descending: true).snapshots();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
