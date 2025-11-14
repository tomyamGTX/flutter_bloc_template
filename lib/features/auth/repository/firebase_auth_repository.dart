import 'package:firebase_auth/firebase_auth.dart';

import '../models/appuser.dart';
import 'auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<AppUser?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) return null;

      return AppUser(uid: user.uid, email: user.email ?? '');
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Stream<AppUser?> get userChanges {
    return FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return null;

      return AppUser(uid: firebaseUser.uid, email: firebaseUser.email ?? "");
    });
  }
}
