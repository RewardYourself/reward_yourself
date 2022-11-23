import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/userWallet/user_wallet_controller.dart';

class CompleteTaskController {
  UserWalletController userWalletController = UserWalletController();
  Future<void> completeTask(idTask, uid) async {
    final db = FirebaseFirestore.instance;

    var completedTask = await db.collection("tasks").doc(idTask).get();

    if (completedTask['permanent'] == false) {
      await db.collection("tasks").doc(idTask).delete();
      AsukaSnackbar.success("Tarefa concluida!").show();
    }

    await userWalletController.addSaldo(completedTask['reward'].toString());

    AsukaSnackbar.success(
            "Tarefa concluida! Você ganhou ${completedTask["reward"].toString()} moedas!!")
        .show();
  }
}
