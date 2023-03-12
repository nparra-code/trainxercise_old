import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trainxercise/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Center(
          child: Consumer<LoginState>(
        builder: (context, value, child) {
          if (value.loading) {
            return CircularProgressIndicator();
          } else {
            return child!;
          }
        },
        child: ElevatedButton(
          onPressed: () {
            Provider.of<LoginState>(context, listen: false).login();
          },
          child: const Text("Log In"),
        ),
      )),
    );
  }
}
