import 'package:flutter/material.dart';
import 'screens/authenticate/authenticate.dart';
import 'screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:deal/models/custom_user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    print(user);

    return user != null ? Home() : const Authenticate();
  }
}
