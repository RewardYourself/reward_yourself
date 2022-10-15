// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  final LoginController loginController;

  @override
  State<LoginPage> createState() => _LoginPageState(loginController);
}

class _LoginPageState extends State<LoginPage> {
  bool continueConnected = false;
  bool _obscureText = true;
  LoginController loginController;
  _LoginPageState(this.loginController);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

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
                  "assets/images/multiTaskGirl.png",
                  alignment: Alignment.center,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Logo.png",
                        width: 34,
                        height: 32,
                      ),
                      Text(
                        "Reward  ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'MavenPro',
                          fontSize: 23,
                          color: Color(0xFFFDA951),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Yourself",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'MavenPro',
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
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            color: Color(0xFF8F8F8F),
                          ),
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
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color(0xFFFDA951)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        errorText: _validateEmail ? 'Campo de email vazio!':null,
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
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
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          errorText: _validatePassword ? 'Campo de senha vazio!':null,
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
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
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon( _obscureText ?Icons.visibility :Icons.visibility_off,
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
                                  color: Colors.black54,
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => Modular.to.pushNamed('/forgetPassword'),
                            child: Text(
                              "Esqueci minha senha",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                      _passwordController.text.isEmpty ? _validatePassword = true : _validatePassword = false;
                    });
                    loginController.signInWithEmail(_emailController.text, _passwordController.text);
                  },
                  child: Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 56),
                    backgroundColor: Color(0xFFFDA951),
                    textStyle: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
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
                        child: Image.asset("assets/images/googleIcon.png"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(70, 41),
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: loginController.signInWithFacebook,
                        child: Image.asset("assets/images/facebookIcon.png"),
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
