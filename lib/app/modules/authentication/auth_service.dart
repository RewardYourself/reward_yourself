import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthService {
  AuthService() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Modular.to.navigate("/login");
      } else {
        Modular.to.navigate("/home");
      }
    });
  }
}
