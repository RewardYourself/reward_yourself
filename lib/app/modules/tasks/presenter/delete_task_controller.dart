import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteTaskController {
  Future<void> deleteTask(idTask) async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("tasks").doc(idTask);

    documentReference.delete().whenComplete(() => {AsukaSnackbar.success("Tarefa deletada!").show()});
  }
}
