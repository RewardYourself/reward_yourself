// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/complete_task_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/delete_task_controller.dart';

class TasksListsWidget extends StatelessWidget {
  const TasksListsWidget({
    Key? key,
    required this.completeTaskController,
    required this.deleteTaskController,
  }) : super(key: key);
  final CompleteTaskController completeTaskController;
  final DeleteTaskController deleteTaskController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();

                  final tasksLength =
                    snapshot.data!.docs.where(
                      (element) => element.data().containsValue(
                        FirebaseAuth.instance.currentUser!.uid
                      )
                    ).length;

                  if (tasksLength > 0) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: tasksLength,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Slidable(
                          endActionPane:
                              ActionPane(motion: const ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (_) {
                                Modular.to.pushNamed(
                                    '/tasks/edit/${documentSnapshot.id}');
                              },
                              backgroundColor: const Color(0xFFfbac53),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Editar',
                            ),
                            SlidableAction(
                              onPressed: (_) {
                                deleteTaskController
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
                                    completeTaskController.completeTask(
                                        documentSnapshot.id,
                                        FirebaseAuth.instance.currentUser!.uid);
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Visibility(
                                    visible: documentSnapshot['duration'] != null,
                                    child: Text(
                                      "Duração: ${documentSnapshot['duration'].toString()} hora",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Maven Pro',
                                        fontSize: 12,
                                        color: Color(0xFF555555),
                                      ),
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
                                  Text(documentSnapshot['reward'].toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  else {
                    return Center(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 120)),
                          Text(
                            "Cadastre suas atividades diárias para\n"
                            "ganhar moedas e poder alcançar o merecido\n"
                            "descanso e lazer.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Maven Pro',
                              fontSize: 14,
                              color: Color(0xFF555555),
                              height: 1.7,
                              letterSpacing: 1
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(top: 70)),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/manTrophy.png"),
                          ),
                        ]
                      ),
                    );
                  }
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
    );
  }
}
