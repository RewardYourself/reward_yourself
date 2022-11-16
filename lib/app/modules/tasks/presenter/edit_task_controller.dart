import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';

class EditTaskController {
  void editTask(TaskModel taskModel, title) {
    final db = FirebaseFirestore.instance;

    db.collection("tasks").doc(title).update(taskModel.toJson());
    AsukaSnackbar.success("Tarefa editada").show();
  }

  Future<TaskModel> getTask(title) async {
    final db = FirebaseFirestore.instance;

    var task = await db.collection("tasks").doc(title).get();

    return TaskModel(
      user: FirebaseAuth.instance.currentUser!.uid,
      title: task["title"],
      reward: task["reward"],
      duration: task["duration"],
      permanent: task["permanent"],
      description: task["description"],
    );
  }
}