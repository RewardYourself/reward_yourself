// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        leading: Image.asset(
          "assets/images/white_logo.png",
          width: 34,
          height: 32,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 65.0),
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          "Configurações",
          style: TextStyle(
            fontFamily: "MavenPro",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFFFDA951)
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Notificações",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Maven Pro',
                          fontSize: 14,
                          color: Color(0xFF8F8F8F),
                          letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        color: Color(0xFFFDA951)
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sobre",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Maven Pro',
                          fontSize: 14,
                          color: Color(0xFF8F8F8F),
                          letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_outlined,
                        color: Color(0xFFFDA951)
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Compartilhe com seus amigos",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Maven Pro',
                          fontSize: 14,
                          color: Color(0xFF8F8F8F),
                          letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Modular.to.navigate('/');
                      },
                      icon: Icon(
                        Icons.logout_outlined,
                        color: Color(0xFFFDA951)
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Modular.to.navigate('/');
                      },
                      child: Text(
                        "Sair",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Maven Pro',
                          fontSize: 14,
                          color: Color(0xFF8F8F8F),
                          letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ]
        ),
      ),
    );
  }
}