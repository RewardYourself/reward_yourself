// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn);
    _animationController.forward();
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) => Modular.to.pushNamed('/login'));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color.fromARGB(84, 239, 232, 192),
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/multiTaskGirl.png",
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}