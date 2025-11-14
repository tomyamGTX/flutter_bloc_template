import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/auth/repository/firebase_auth_repository.dart';

import '../models/appuser.dart';

class AuthCubit extends Cubit<AppUser?> {
  final FirebaseAuthRepository authRepo;

  AuthCubit(this.authRepo) : super(null) {
    authRepo.userChanges.listen(emit);
  }

  Future<void> signIn(String email, String password) async {
    final user = await authRepo.signIn(email, password);
    emit(user);
  }
}
