// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/components/body.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  final LoginController loginController;

  @override
  State<LoginPage> createState() => _LoginPageState(loginController);
}

class _LoginPageState extends State<LoginPage> {
  bool continueConnected = false;
  LoginController loginController;
  _LoginPageState(this.loginController);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "../../../../../assets/images/multiTaskGirl.png",
                  alignment: Alignment.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "../../../../../assets/images/Logo.png",
                      width: 34,
                      height: 32,
                    ),
                    Text(
                      "Reward  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFDA951),
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      "Yourself",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Color(0xFFFDA951),
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Fazer Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF8F8F8F)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () => Modular.to.pushNamed('/register'),
                          child: Text(
                            "Criar uma conta",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0xFFFDA951)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Form(child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFFFDA951),
                            )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 6)),
                    TextFormField(
                      controller: _passwordController,
                      autofocus: true,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xFFFDA951),
                              )),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              print("Visibilidade da senha alterada!");
                            },
                            child: Icon(
                              Icons.visibility,
                              color: Color(0xFFFDA951),
                            ),
                          )),
                    ),
                  ],
                )),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFFFDA951),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              value: continueConnected,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    continueConnected = newValue;
                                  }
                                });
                              },
                            ),
                            Text(
                              "Lembrar-me",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              print("Esqueci minha senha!");
                            },
                            child: Text(
                              "Esqueci minha senha",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                ElevatedButton(
                  onPressed: () => loginController.signInWithEmail(_emailController.text, _passwordController.text),
                  child: Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 56),
                    backgroundColor: Color(0xFFFDA951),
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 35)),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: loginController.signInWithGoogle,
                        child: Image.asset(
                            "../../../../../assets/images/googleIcon.png"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(70, 41),
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: loginController.signInWithFacebook,
                        child: Image.asset(
                            "../../../../../assets/images/facebookIcon.png"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(70, 41),
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
