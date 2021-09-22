import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService(uid, {this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future getUserData() async {
    return userCollection.doc(uid);
  }

  Future updateUserData(String name, String surname, String uid) async {
    return userCollection
        .doc(uid)
        .set({"name": name, "surname": surname, "uid": uid});
  }
}
