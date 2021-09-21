import 'package:deal/screens/authenticate/log_in.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'log_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toogleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return (showSignIn == true)
        ? LogIn(toggleView: toogleView)
        : Register(toggleView: toogleView);
  }
}
