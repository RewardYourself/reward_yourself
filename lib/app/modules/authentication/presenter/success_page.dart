// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn);
    _animationController.forward();
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) => Modular.to.navigate('/home'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.only(top: 206)),
                Image.asset(
                  "assets/images/checked.png",
                  alignment: Alignment.center,
                  height: 80,
                ),
                Padding(padding: EdgeInsets.only(top: 28)),
                Text(
                  "Cadastro\n"
                  "concluído!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Archivo',
                    fontSize: 32,
                    color: Color(0xFFFDA951),
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Text(
                  "Agora você faz parte da\n"
                  "plataforma Reward Yourself.",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF989898),
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Já que está aqui, corra logo para cadastrar\n"
                  "suas atividades e aproveitar suas recompensas.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xFF989898),
                    height: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          )
          
        )
      )
    );
  }
}