import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/model/login_model.dart';
import 'package:firstproject/modules/login/cubitt/states.dart';
import 'package:firstproject/server/auth_server.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<loginstates> {
  LoginCubit() : super(logininitialstate());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffixIcon = Icons.remove_red_eye_outlined;
  bool isObserve = true;
  final AuthServer _authServer = AuthServer();
  void changeSuffexIcon() {
    isObserve = !isObserve;
    suffixIcon =
        isObserve ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(suffixIconState());
  }

  void userLogin({required String email, required String password}) async {
    UserCredential? res = await _authServer.loginWithEmailAndPassword(
        email: email, password: password).then((value) {
      value != null
          ? emit(loginsuccessstate(loginmodel.fromJson({
        'status':'sign in',
        'message':'sign in successfully',
        'data':null
      })))
          : emit(loginerrorstate(' sign in failed'));
    }).catchError((e) {
      emit(loginerrorstate('$e'));
    });
    print(res?.user);
  }
}
