import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: Color(0xFFFDA951),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Modular.to.navigate('/');
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Color(0xFFFFFFFF))
            ),
          ),
        ],
      ),
      body: Column(children: [
        Padding(padding: EdgeInsets.only(bottom: 50),),
        Text(
          "Cadastro concluído!",
          textScaleFactor: 5,
          textAlign: TextAlign.center,
        ),
      ])
    );
  }
}