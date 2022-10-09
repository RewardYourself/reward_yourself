import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key, this.login = true, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text( 
          login ? "Ainda não tem uma conta?" : "Já tem uma conta?",
          style: TextStyle(color: Color(0xFFFDA951)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastre-se" : "Entrar na conta",
            style: TextStyle(
              color: Color(0xFFFDA951),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
