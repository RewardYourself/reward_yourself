import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';

class EditTaskController {
  void editTask(TaskModel taskModel, String? id) {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    db.collection("tasks").doc(id).update(taskModel.toJson());
    AsukaSnackbar.success("Tarefa editada").show();
  }
}