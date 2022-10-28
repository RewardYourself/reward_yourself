import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';

class RegisterController {
  register(emailAddress, password, confirmPassword) async {
    if (password != confirmPassword) {
      AsukaSnackbar.alert("As senhas não coincidem").show();
    }
    else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        Modular.to.navigate('/success');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AsukaSnackbar.alert("A senha é muito fraca").show();
        } else if (e.code == 'email-already-in-use') {
          AsukaSnackbar.alert("A conta já existe para esse e-mail").show();
        } else if (e.code == 'invalid-email'){
          AsukaSnackbar.alert("Formato de e-mail inválido").show();
        }
      } catch (e) {
        AsukaSnackbar.alert("Não foi possível criar a conta, erro não identificado").show();
      }
    }
  }
}
