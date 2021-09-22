import 'package:flutter/material.dart';
import 'package:deal/services/auth.dart';
import 'package:deal/shared/constants.dart';
import 'package:deal/shared/loading.dart';

class Register extends StatefulWidget {
  const Register({Key? key, this.toggleView}) : super(key: key);

  final VoidCallback? toggleView;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String name = '';
  String surname = '';

  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.yellow[100],
            appBar: AppBar(
              backgroundColor: Colors.yellow[500],
              elevation: 0.0,
              actions: [
                TextButton.icon(
                    onPressed: widget.toggleView,
                    icon: const Icon(Icons.person),
                    label: const Text("Sign In")),
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 32.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Email"),
                        validator: (val) =>
                            val!.isEmpty ? "Enter an email" : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Password"),
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? "Enter a password 6+ chars"
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Name"),
                        validator: (val) => nameRegEx.hasMatch(val!)
                            ? "Enter valid Name"
                            : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Surname"),
                        validator: (val) => nameRegEx.hasMatch(val!)
                            ? "Enter valid Surname"
                            : null,
                        onChanged: (val) {
                          setState(() => surname = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                          child: const Text("Register"),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.register(
                                  email, password, name, surname);
                              if (result == null) {
                                setState(() {
                                  error = "Please supply a valid email";
                                  loading = false;
                                });
                              }
                            }
                          }),
                    ],
                  ),
                )),
          );
  }
}
