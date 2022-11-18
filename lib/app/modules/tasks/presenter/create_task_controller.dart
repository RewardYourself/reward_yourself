import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';

class CreateTaskController {
  bool createTask(TaskModel taskModel) {
    var success = false;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("tasks").doc();
    documentReference
        .set(taskModel.toJson())
        .whenComplete(() => {
          success = true,
          AsukaSnackbar.success("Tarefa criada").show()}
        );
    return success;
    //final db = FirebaseFirestore.instance;
    //db.collection("tasks").add(taskModel.toJson());
    //AsukaSnackbar.success("Tarefa criada").show();
  }
}
