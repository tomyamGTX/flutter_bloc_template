import '../models/appuser.dart';

abstract class AuthRepository {
  Future<AppUser?> signIn(String email, String password);
  Future<void> signOut();
  Stream<AppUser?> get userChanges;
}
