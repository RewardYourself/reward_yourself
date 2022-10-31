import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/success_controller.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key, required this.successController}) : super(key: key);

  final SuccessController successController;

  @override
  State<SuccessPage> createState() => _SuccessPageState(successController);
}

class _SuccessPageState extends State<SuccessPage> {
  SuccessController successController;
  _SuccessPageState(this.successController);
  
  String userName = '';
  String textUser = '';

  @override
  Widget build(BuildContext context) {
    if (successController.getUserName() != null) {
      userName = successController.getUserName().toString();
      textUser = 'Sucesso $userName';
    }
    else {
      textUser = 'Sucesso';
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
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/multiTaskGirl.png",
                alignment: Alignment.center,
              ),
            ],
          )
        )
      )
    );
  }
}