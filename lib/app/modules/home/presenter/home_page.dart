// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_controller.dart';
import 'package:reward_yourself/app/modules/home/presenter/widgets/money_widget.dart';
import 'package:reward_yourself/app/modules/home/presenter/widgets/rewards_list_widget.dart';
import 'package:reward_yourself/app/modules/home/presenter/widgets/tasks_lists_widget.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/complete_reward_controller.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/delete_reward_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/complete_task_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/delete_task_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.homeController,
    required this.completeTaskController,
    required this.deleteTaskController,
    required this.completeRewardController,
    required this.deleteRewardController,
  }) : super(key: key);

  final HomeController homeController;

  final CompleteTaskController completeTaskController;
  final DeleteTaskController deleteTaskController;
  final CompleteRewardController completeRewardController;
  final DeleteRewardController deleteRewardController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.getTasks(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  final pageController = PageController();

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
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                    child: Align(
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
                          child: MoneyWidget(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TasksListsWidget(
                          completeTaskController: widget.completeTaskController,
                          deleteTaskController: widget.deleteTaskController,
                        ),
                        RewardListWidget(
                          completeRewardController:
                              widget.completeRewardController,
                          deleteRewardController: widget.deleteRewardController,
                        ),
                      ],
                    ),
                  ),
                ],
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
            tooltip: "Adicionar",
            onPressed: () {
              if (pageController.page == 0) {
                Modular.to.pushNamed('/tasks/create').then(
                      (value) => widget.homeController
                          .getTasks(FirebaseAuth.instance.currentUser!.uid),
                    );
              } else {
                Modular.to.pushNamed('/rewards/create').then(
                      (value) => widget.homeController
                          .getTasks(FirebaseAuth.instance.currentUser!.uid),
                    );
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ]),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          onPressed: () {
            pageController.jumpToPage(1);
          },
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
                        onPressed: () {
                          pageController.jumpToPage(0);
                        },
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
