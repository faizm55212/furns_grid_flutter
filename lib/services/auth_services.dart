// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  AuthenticationServices(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async => await _firebaseAuth.signOut();

  Future<String> logIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signup({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
