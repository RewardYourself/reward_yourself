import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'model/walletModel.dart';

class UserWalletController {

  void createWallet(WalletModel walletModel) {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("wallets").doc(walletModel.user);
    documentReference.set(walletModel.toJson()).whenComplete(() => {
      AsukaSnackbar.success("Carteira criada").show()
    });
  }

  Future<void> addSaldo(String amount) async {
    try{
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var value = double.parse(amount);
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('wallets')
          .doc(uid);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        double newBalance = snapshot.get('amount') + value; 
        transaction.update(documentReference, {'amount':newBalance});
      });
    }catch(e){
      print("\n\n"+e.toString()+"\n\n");
    }
  }

  Future<WalletModel> getWallet(uid) async {
    final db = FirebaseFirestore.instance;

    var wallet = await db.collection("wallets").doc(uid).get();

    return WalletModel(
      user: FirebaseAuth.instance.currentUser!.uid,
      amount: wallet["amount"],
    );
  }
}
