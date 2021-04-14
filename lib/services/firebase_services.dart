import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection("Users");
}
