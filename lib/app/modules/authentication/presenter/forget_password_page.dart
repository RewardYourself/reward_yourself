// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late String _email;
  final auth = FirebaseAuth.instance;

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
                      "assets/images/logo.png",
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
                          "Esqueci a senha",
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
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
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
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    ElevatedButton(
                      onPressed: () {
                        auth.sendPasswordResetEmail(email: _email)
                        .then((_){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Email para alterar senha enviado!"),
                              backgroundColor: Colors.green,
                            )
                          );
                          Future.delayed(Duration(seconds: 3)).then((_) => Modular.to.pushNamed('/login'));
                        }).catchError((error){
                          if(error.code.toString() == 'user-not-found'){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Email não cadastrado!", style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.red,
                              )
                            );
                          }else if(error.code.toString() == 'invalid-email'){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Email Inválido!", style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.red,
                              )
                            );
                          }else if(error.code.toString() == 'too-many-requests'){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Muitas tentativas, tente novamente mais tarde!", style: TextStyle(color: Colors.white38),),
                                backgroundColor: Colors.red,
                              )
                            );
                          }
                        });
                      },
                      child: Text("Enviar Link de Alteração"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 56),
                        backgroundColor: Color(0xFFFDA951),
                        textStyle: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
