import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/userWallet/user_wallet_controller.dart';

class CompleteTaskController {
  UserWalletController userWalletController = UserWalletController();
  Future<void> completeTask(item) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("tasks").doc(item);

    var snapshot = await documentReference.get();

    if (snapshot["permanent"] == false) {
      documentReference.delete().whenComplete(
          () => {AsukaSnackbar.success("Tarefa concluida!").show()});
    }

    userWalletController.addSaldo(snapshot["reward"].toString());

    AsukaSnackbar.success(
            "Você ganhou " + snapshot["reward"].toString() + " moedas!!")
        .show();
  }
}
