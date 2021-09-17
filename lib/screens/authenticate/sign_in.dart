import 'package:deal/models/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deal/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
            child: Text("Sign In"),
            onPressed: () async {
              CustomUser? result = await _auth.signInAnon();
              if (result == null) {
                print("error signin");
              } else {
                print("signed in");
                print(result.uid);
              }
            }),
      ),
    );
  }
}
