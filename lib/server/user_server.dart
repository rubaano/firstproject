import 'package:cloud_firestore/cloud_firestore.dart';

class UserServer {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _productCollection =
      _fireStore.collection('users');

  Future<bool> addNewUser(Map<String, dynamic> data, String userID) {
    return _productCollection
        .doc(userID)
        .set(data)
        .then((value) => true)
        .catchError((e) => false);
  }

  Future<Map<String, dynamic>?> getUser(String userID) {
    return _productCollection
        .doc(userID)
        .get()
        .then((value) => value.data() as Map<String, dynamic>?)
        .catchError((e) => null);
  }
}
