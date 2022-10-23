import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/create_tasks/models/task_model.dart';

class CreateTaskController {
  void createTask(TaskModel taskModel) {
    final db = FirebaseFirestore.instance;

    db.collection("tasks").add(taskModel.toJson());
    AsukaSnackbar.success("Tarefa criada").show();
  }
}
