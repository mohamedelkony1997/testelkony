

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null; // Return null if login is successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message if login fails
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
