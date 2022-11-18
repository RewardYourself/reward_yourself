import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/userWallet/user_wallet_controller.dart';

import '../models/task_model.dart';

class CompleteTaskController {
  UserWalletController userWalletController = UserWalletController();
  Future<void> completeTask(title, uid) async {
    final db = FirebaseFirestore.instance;

    final tasksQuery = await db.collection("tasks").get();
    String idTask = "";
    final tasks = tasksQuery.docs.map((e) {
      if (e.data().containsValue(title) && e.data().containsValue(uid)) {
        idTask = e.id;
        return TaskModel.fromJson(e.data());
      }
    }).toList();

    var completedTask = await db.collection("tasks").doc(idTask).get();

    if (completedTask['permanent'] == false) {
      db.collection("tasks").doc(idTask).delete().whenComplete(
          () => {AsukaSnackbar.success("Tarefa concluida!").show()});
    }

    userWalletController.addSaldo(completedTask['reward'].toString());

    AsukaSnackbar.success(
      "Tarefa concluida! Você ganhou ${completedTask["reward"].toString()} moedas!!")
      .show();
  }
}
