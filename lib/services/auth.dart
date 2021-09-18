import 'package:firebase_auth/firebase_auth.dart';
import 'package:deal/models/custom_user.dart';
import 'package:provider/provider.dart';

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

  //register email password

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