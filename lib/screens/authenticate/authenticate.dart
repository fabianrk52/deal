import 'package:deal/screens/authenticate/log_in_form.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'register.dart';
import 'log_in_form.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return LogInForm();
  }
}
