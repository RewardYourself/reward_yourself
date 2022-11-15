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
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        actions: <Widget>[
          IconButton(
            onPressed:(){}, icon: Icon(Icons.notifications_outlined, color: Color(0xFFFDA951))
            )
        ],
        leading: Image.asset(
            "assets/images/logo.png",
            width: 50,
            height: 50,
        ),
        backgroundColor: Color.fromRGBO(255, 250, 244, 1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color:Color.fromARGB(121, 255, 242, 229),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/multiTaskGirl.png"),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
              child:  FloatingActionButton(
              backgroundColor: Color.fromRGBO(242, 242, 242, 1),
              foregroundColor: Color(0xFFFDA951),
              tooltip: "Adicionar Tarefas",
              onPressed: () {
                Modular.to.pushNamed('/addTask');
              },
              child: Icon(Icons.add),
              
            ),
          ),
          Container(
            color:Color.fromARGB(121, 255, 242, 229),
            child: Row(
            children: [
                Image.asset('images/money.png'),
                Text("50", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MavenPro',
                  fontSize: 14,
                  color: Color(0xFFFDA951),
                ),
                ),
            ],
          ),
          ),
          Container(
            child: Row(
            children: [
              Text("Suas ",style: const TextStyle(fontFamily: 'MavenPro',
                  fontSize: 16,color:Color.fromRGBO(143, 143, 143, 1))),
              Text("Tarefas", style: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'MavenPro',
                  fontSize: 16,color:Color.fromRGBO(143, 143, 143, 1)))
            ],
          ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          onPressed: () {},
          child: Image.asset(
            "assets/images/trophy.png",
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
                        icon: Image.asset('images/list.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                      SizedBox(width: 24),
                      IconButton(
                        icon: Image.asset('images/person.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                    ],
                  )))),
    );
  }
}
