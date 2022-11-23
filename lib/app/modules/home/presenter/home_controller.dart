import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  String? getUserName() {
    return FirebaseAuth.instance.currentUser?.displayName;
  }

  @observable
  bool isLoading = false;
  @observable
  List<TaskModel> tasks = [];

  @action
  Future<void> getTasks(uid) async {
    final db = FirebaseFirestore.instance;
    isLoading = true;
    final tasksQuery = await db
        .collection("tasks")
        .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    final tasks = tasksQuery.docs.map((e) {
      return TaskModel.fromJson(e.data());
    }).toList();

    this.tasks = tasks;
    isLoading = false;
  }
}
