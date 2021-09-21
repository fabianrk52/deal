import 'package:deal/models/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deal/services/auth.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
        title: Text("Logo"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: [
                const Text(
                  "Log In",
                  style: TextStyle(fontSize: 32.0),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val) {
                    email = val;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    child: Icon(
                      Icons.send,
                      size: 20.0,
                      color: Colors.blue[200],
                    ),
                    onPressed: () async {
                      CustomUser? result = await _auth.LogIn(email, password);
                      if (result == null) {
                        print("error signin");
                      } else {
                        print("signed in");
                        print(result.uid);
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
