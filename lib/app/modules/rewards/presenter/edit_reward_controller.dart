import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_yourself/app/modules/rewards/models/reward_model.dart';

class EditRewardController {
  Future<void> editReward(RewardModel rewardModel, idReward, uid) async {
    final db = FirebaseFirestore.instance;

    final rewardsQuery = await db.collection("rewards").get();

    final rewards = rewardsQuery.docs.map((e) {
      if (e.id == idReward && e.data().containsValue(uid)) {
        return RewardModel.fromJson(e.data());
      }
    }).toList();

    if (idReward != "") {
      db.collection("rewards").doc(idReward).update(rewardModel.toJson());
    }
    AsukaSnackbar.success("Tarefa editada").show();
  }

  Future<RewardModel> getReward(idReward, uid) async {
    final db = FirebaseFirestore.instance;

    final rewardsQuery = await db.collection("rewards").get();

    final rewards = rewardsQuery.docs.map((e) {
      if (e.id == idReward && e.data().containsValue(uid)) {
        return RewardModel.fromJson(e.data());
      }
    }).toList();
    print(idReward);

    var reward = await db.collection("rewards").doc(idReward).get();

    return RewardModel(
      user: FirebaseAuth.instance.currentUser!.uid,
      title: reward["title"],
      reward: reward["cost"],
      duration: reward["duration"],
      permanent: reward["permanent"],
      description: reward["description"],
    );
  }
}
