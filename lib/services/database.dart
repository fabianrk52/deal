import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future getUserData() async {
    return userCollection.doc(uid);
  }

  Future updateUserData(
      String name, String surname, String email, String uid) async {
    return userCollection.doc(uid).set({
      "name": name,
      "surname": surname,
      "email": email,
      "deals": [],
      "uid": uid
    });
  }

  //get users stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
