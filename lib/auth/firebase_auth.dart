import 'package:crypto_wallet_app/auth/auth_db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthService(this.firebaseAuth);

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Sign In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password,required String username}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DatabaseService(uid: firebaseAuth.currentUser!.uid).postUserData(email, username);
      return "Sign Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}