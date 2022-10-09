import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar conta'),
      ),
      body: Column(children: <Widget>[
        Image.asset(
          "../../../../../assets/images/multiTaskGirl.png",
          fit: BoxFit.cover,
          height: 180.0,
        ),
        Row(
          children: [
            Image.asset(
              "../../../../../assets/images/Logo.png"
            ),
            Text("Reward Yourself")
          ],
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Nome",
          ),
          controller: _nameController,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
          ),
          controller: _emailController,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Senha",
          ),
          controller: _passwordController,
        ),
        ElevatedButton(
          onPressed: () => register(_nameController.text, _emailController.text, _passwordController.text),
          child: Text("Cadastrar"),
        ),
      ]),
    );
  }
}
