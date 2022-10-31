import 'package:firebase_auth/firebase_auth.dart';

class SuccessController {
  String? getUserName() {
    return FirebaseAuth.instance.currentUser?.displayName;
  }
}