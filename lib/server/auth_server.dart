import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/server/user_server.dart';

class AuthServer {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserServer _userServer = UserServer();

  Future<UserCredential?> loginWithEmailAndPassword(
      {required String email, required String password}) {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) => throw e);
  }

  Future<UserCredential?> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber}) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (value.user != null) {
        await _userServer.addNewUser(
            {'name': name, 'phoneNumber': phoneNumber}, value.user!.uid);
      }
      return value;
    }).catchError((e) => throw e);
  }

  Future<void> sendResetPasswordCode({required String email}) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> confirmResetPassword(
      {required String code, required String newPassword}) {
    return _firebaseAuth
        .confirmPasswordReset(code: code, newPassword: newPassword)
        .then((value) => true)
        .catchError((e) => false);
  }
}
