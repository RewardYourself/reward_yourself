// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/complete_task_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/delete_task_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.homeController,
      required this.completeTaskController,
      required this.deleteTaskController})
      : super(key: key);

  final HomeController homeController;

  final CompleteTaskController completeTaskController;
  final DeleteTaskController deleteTaskController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.getTasks(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

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

    if (widget.homeController.getUserName() != null) {
      userName = widget.homeController.getUserName().toString();
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
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'MavenPro',
            fontSize: 16,
            color: Color(0xFFFDA951),
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined,
                  color: Color(0xFFFDA951)))
        ],
        leading: Image.asset(
          "assets/images/Logo.png",
          width: 50,
          height: 50,
        ),
        backgroundColor: const Color.fromRGBO(255, 250, 244, 1),
        elevation: 0,
      ),
      body: Stack(children: [
        Column(
          children: [
            Column(
              children: [
                Container(
                  color: const Color.fromARGB(121, 255, 242, 229),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/multiTaskGirl.png"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF7E3),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/money.png'),
                                const Text(
                                  "50",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'MavenPro',
                                    fontSize: 14,
                                    color: Color(0xFFFDA951),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 23)),
                      Row(
                        children: const [
                          Text("Suas ",
                              style: TextStyle(
                                  fontFamily: 'MavenPro',
                                  fontSize: 16,
                                  color: Color.fromRGBO(143, 143, 143, 1))),
                          Text("Tarefas",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'MavenPro',
                                  fontSize: 16,
                                  color: Color.fromRGBO(143, 143, 143, 1)))
                        ],
                      ),
                      SingleChildScrollView(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("tasks")
                              .where('user',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (((context, snapshot) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs
                                  .where((element) => element
                                      .data()
                                      .containsValue(
                                          FirebaseAuth.instance.currentUser!.uid))
                                  .length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot documentSnapshot =
                                    snapshot.data!.docs[index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (_) {
                                            Modular.to.pushNamed(
                                                '/tasks/edit/${documentSnapshot.id}');
                                          },
                                          backgroundColor:
                                              const Color(0xFFfbac53),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Editar',
                                        ),
                                        SlidableAction(
                                          onPressed: (_) {
                                            widget.deleteTaskController
                                              .deleteTask(documentSnapshot.id);
                                          },
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Excluir',
                                        ),
                                      ]),
                                  child: Card(
                                    child: ListTile(
                                      minVerticalPadding: 16,
                                      leading: CircleAvatar(
                                        backgroundColor: const Color(0xFFfbac53),
                                        foregroundColor: Colors.black,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.done,
                                            size: 24,
                                          ),
                                          onPressed: (() {
                                            widget.completeTaskController
                                              .completeTask(
                                                documentSnapshot.id,
                                                FirebaseAuth.instance
                                                  .currentUser!.uid);
                                          }),
                                        ),
                                      ),
                                      title: Text(
                                        documentSnapshot['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Maven Pro',
                                          fontSize: 18,
                                          color: Color(0xFF555555),
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            documentSnapshot['description'] ?? "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Maven Pro',
                                              fontSize: 14,
                                              color: Color(0xFF555555),
                                            ),
                                          ),
                                          Text(
                                            "Duração: ${documentSnapshot['duration'].toString()} hora",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Maven Pro',
                                              fontSize: 12,
                                              color: Color(0xFF555555),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset("assets/images/coin.png"),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(documentSnapshot['reward']
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          })),
                        ),
                      ),
                      //Observer(
                      //  builder: (context) {
                      //
                      //  },
                      //),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
          top: 180,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            foregroundColor: const Color(0xFFFDA951),
            tooltip: "Adicionar Tarefas",
            onPressed: () {
              Modular.to.pushNamed('/tasks/create').then(
                    (value) => widget.homeController
                        .getTasks(FirebaseAuth.instance.currentUser!.uid),
                  );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ]),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          onPressed: () {},
          child: Image.asset(
            "assets/images/Trophy.png",
            width: 50,
            height: 50,
          )),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: IconTheme(
              data: const IconThemeData(color: Color(0xFFFDA951)),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/list.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: Image.asset('assets/images/person.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                    ],
                  )))),
    );
  }
}
