import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/userWallet/user_wallet_controller.dart';

class CompleteRewardController {
  UserWalletController userWalletController = UserWalletController();
  Future<void> completeReward(idReward, uid) async {
    final db = FirebaseFirestore.instance;

    final wallet = await db.collection("wallets").doc(uid).get();
    if (wallet.exists) {
      final saldo = wallet.get("amount");
      var completedReward = await db.collection("rewards").doc(idReward).get();

      if (saldo >= completedReward['cost']) {
        if (completedReward['permanent'] == false) {
          await db.collection("rewards").doc(idReward).delete();
          AsukaSnackbar.success("Tarefa concluida!").show();
        }

        await userWalletController
            .subtrairSaldo(completedReward['cost'].toString());

        AsukaSnackbar.success(
                "Recompensa Regatada! Você gastou ${completedReward["cost"].toString()} moedas!!")
            .show();
      } else {
        AsukaSnackbar.alert(
                "Você não tem moedas suficientes para resgatar essa recompensa")
            .show();
      }
    } else {
      AsukaSnackbar.alert(
              "Você não tem moedas suficientes para resgatar essa recompensa")
          .show();
    }
  }
}
