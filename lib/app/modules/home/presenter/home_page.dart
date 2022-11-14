import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.homeController}) : super(key: key);

  final HomeController homeController;

  @override
  State<HomePage> createState() => _HomePageState(homeController);
}

class _HomePageState extends State<HomePage> {
  HomeController homeController;
  _HomePageState(this.homeController);

  String userName = '';
  String textUser = '';
  String greetings = '';

  @override
  Widget build(BuildContext context) {
    final hour = TimeOfDay.now().hour;

    if (hour < 12) {
      greetings = 'Bom dia';
    } else if (hour < 18) {
      greetings = 'Boa tarde';
    } else {
      greetings = 'Boa noite';
    }

    if (homeController.getUserName() != null) {
      userName = homeController.getUserName().toString();
      textUser = '$greetings, $userName!';
    } else {
      textUser = '$greetings!';
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          centerTitle: true,
          title: Text(
            textUser,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'MavenPro',
              fontSize: 16,
              color: Color(0xFFFDA951),
            ),
          ),
          backgroundColor: Color.fromRGBO(255, 250, 244, 1),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/multiTaskGirl.png"))),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50),
        ),
      ]),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          onPressed: () {},
          child: Image.asset(
            "assets/images/Trophy.png",
            width: 50,
            height: 50,
          )),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Color.fromRGBO(246, 246, 246, 1),
          child: IconTheme(
              data: IconThemeData(color: Color(0xFFFDA951)),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.list, size: 30.0),
                        onPressed: () {},
                      ),
                      SizedBox(width: 24),
                      IconButton(
                        icon: Icon(Icons.person, size: 30.0),
                        onPressed: () {},
                      ),
                    ],
                  )))),
    );
  }
}
