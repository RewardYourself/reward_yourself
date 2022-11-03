import 'package:firebase_auth/firebase_auth.dart';

class HomeController {
  String? getUserName() {
    return FirebaseAuth.instance.currentUser?.displayName;
  }
}