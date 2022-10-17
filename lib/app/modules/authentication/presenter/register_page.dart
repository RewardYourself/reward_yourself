import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _validatePassword = false;
   bool _validateConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                        "Reward ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'MavenPro',
                          color: Color(0xFFFDA951),
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        "Yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDA951),
                          fontSize: 23,
                        ),
                      ),
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
                              "Crie sua conta",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                color: Color(0xFF8F8F8F),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ]),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            errorText: _validatePassword
                              ? 'Campo de senha vazio!'
                              : null,
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
                              child: Icon(
                               _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFFFDA951),
                              ),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      TextFormField(
                        controller: _confirmPasswordController,
                        autofocus: true,
                        obscureText: _obscureTextConfirm,
                        decoration: InputDecoration(
                            labelText: "Confirmar senha",
                             errorText: _validateConfirmPassword
                              ? 'Campo de senha vazio!'
                              : null,
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
                                  _obscureTextConfirm = !_obscureTextConfirm;
                                });
                              },
                              child: Icon(
                                 _obscureTextConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                color: Color(0xFFFDA951),
                              ),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  )),
                  ElevatedButton(
                    onPressed: () => register(
                        _emailController.text, _passwordController.text),
                    child: Text("Cadastrar"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 56),
                      backgroundColor: Color(0xFFFDA951),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                          fontSize: 16),
                    ),
                  ),
                ]))));
  }
}
