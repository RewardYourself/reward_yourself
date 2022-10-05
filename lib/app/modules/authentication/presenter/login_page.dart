import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  final LoginController loginController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(children: [
        TextButton(
          onPressed: loginController.signInWithGoogle,
          child: Text("Login com o google"),
        ),
        TextButton(
          onPressed: loginController.signInWithFacebook,
          child: Text("Login com o facebook"),
        ),
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("Teste logout"))
      ]),
    );
  }
}
