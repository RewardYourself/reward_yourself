import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompleteTaskController {
  Future<void> completeTask(item) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("tasks").doc(item);

    var snapshot = await documentReference.get();

    if (snapshot["permanent"] == false) {
      documentReference.delete().whenComplete(
          () => {AsukaSnackbar.success("Tarefa concluida!").show()});
    }
    AsukaSnackbar.success("Você ganhou " + snapshot["cost"].toString() + " moedas!!").show();
  }
}
