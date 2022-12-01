import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteRewardController {
  Future<void> deleteReward(idReward) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("rewards").doc(idReward);

    documentReference
        .delete()
        .whenComplete(() => {AsukaSnackbar.success("Tarefa deletada!").show()});
  }
}
