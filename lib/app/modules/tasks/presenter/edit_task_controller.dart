import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';

class EditTaskController {
  Future<void> editTask(TaskModel taskModel, idTask, uid) async {
    final db = FirebaseFirestore.instance;

    final tasksQuery = await db.collection("tasks").get();

    final tasks = tasksQuery.docs.map((e) {
      if (e.id == idTask && e.data().containsValue(uid)) {
        return TaskModel.fromJson(e.data());
      }
    }).toList();

    if (idTask != "") {
      db.collection("tasks").doc(idTask).update(taskModel.toJson());
    }
    AsukaSnackbar.success("Tarefa editada").show();
  }

  Future<TaskModel> getTask(idTask, uid) async {
    final db = FirebaseFirestore.instance;

    final tasksQuery = await db.collection("tasks").get();

    final tasks = tasksQuery.docs.map((e) {
      if (e.id == idTask && e.data().containsValue(uid)) {
        return TaskModel.fromJson(e.data());
      }
    }).toList();
    print(idTask);

    var task = await db.collection("tasks").doc(idTask).get();

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
