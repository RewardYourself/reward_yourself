import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        Text(
          "Reward Yourself",
          textScaleFactor: 5,
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Modular.to.navigate('/');
          },
          child: Text("Logout")
        )
      ])
    );
  }
}