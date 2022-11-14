import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.homeController}) : super(key: key);

  final HomeController homeController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';
  String textUser = '';

  @override
  Widget build(BuildContext context) {
    if (widget.homeController.getUserName() != null) {
      userName = widget.homeController.getUserName().toString();
      textUser = 'Bem vindo, $userName';
    }
    else {
      textUser = 'Bem-vindo!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(textUser),
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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 50),),
          Text(
            "Reward Yourself",
            textScaleFactor: 5,
            textAlign: TextAlign.center,
          ),
        ]
      )
    );
  }
}