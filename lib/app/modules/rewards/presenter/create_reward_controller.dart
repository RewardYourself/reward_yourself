import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_yourself/app/modules/rewards/models/reward_model.dart';

class CreateRewardController {
  bool createReward(RewardModel rewardModel) {
    var success = false;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("rewards").doc();
    documentReference.set(rewardModel.toJson()).whenComplete(() =>
        {success = true, AsukaSnackbar.success("Recompensa criada").show()});
    return success;
    //final db = FirebaseFirestore.instance;
    //db.collection("rewards").add(rewardModel.toJson());
    //AsukaSnackbar.success("Tarefa criada").show();
  }
}
