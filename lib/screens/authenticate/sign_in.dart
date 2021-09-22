import 'package:flutter/material.dart';
import 'package:deal/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.toggleView}) : super(key: key);

  final VoidCallback? toggleView;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
        title: const Icon(Icons.list),
        actions: [
          ElevatedButton.icon(
              onPressed: widget.toggleView,
              icon: const Icon(Icons.person),
              label: const Text("Register"))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 32.0),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val) =>
                      val!.length < 6 ? "Enter a password 6+ chars" : null,
                  onChanged: (val) {
                    setState(() => password = val);
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
                      if (_formkey.currentState!.validate()) {
                        dynamic result = await _auth.signIn(email, password);
                        if (result == null) {
                          setState(() => error = "Invalid credentials");
                        }
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
