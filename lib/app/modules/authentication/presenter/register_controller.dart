import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:reward_yourself/app/modules/userWallet/model/walletModel.dart';

import '../../userWallet/user_wallet_controller.dart';

class RegisterController {
  UserWalletController userWalletController = UserWalletController();

  Future<bool> register(
      userName, emailAddress, password, confirmPassword) async {
    if (password != confirmPassword) {
      AsukaSnackbar.alert("As senhas não coincidem").show();
      return false;
    } else {
      try {
        // set login - email and password
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailAddress,
              password: password,
            )
            .whenComplete(() => {
                  if (FirebaseAuth.instance.currentUser != null)
                    {
                      FirebaseAuth.instance.currentUser
                          ?.updateDisplayName(userName),
                    }
                });
        WalletModel walletModel = WalletModel(
          user: FirebaseAuth.instance.currentUser!.uid, 
          amount: 0
        );
        userWalletController.createWallet(walletModel);

        Modular.to.navigate('/success');

        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AsukaSnackbar.alert("A senha é muito fraca").show();
        } else if (e.code == 'email-already-in-use') {
          AsukaSnackbar.alert("A conta já existe para esse e-mail").show();
        } else if (e.code == 'invalid-email') {
          AsukaSnackbar.alert("Formato de e-mail inválido").show();
        }
        return false;
      } catch (e) {
        print(e);
        AsukaSnackbar.alert(
                "Não foi possível criar a conta, erro não identificado")
            .show();
        return false;
      }
    }
  }
}
