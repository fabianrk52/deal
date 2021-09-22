import 'package:deal/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deal/models/custom_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser? _userFromFirebase(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<CustomUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in anonymus
  Future signInAnon() async {
    try {
      UserCredential? result = await _auth.signInAnonymously();
      CustomUser? _user = _userFromFirebase(result.user);
      return _user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign email password

  Future signIn(email, password) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email password
  Future register(email, password) async {
    try {
      UserCredential? result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //create document for the user with uid
      await DatabaseService(uid: user?.uid)
          .updateUserData("default", "default", user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
