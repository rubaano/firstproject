import 'package:firstproject/model/login_model.dart';
import 'package:firstproject/modules/sign%20up/cubit/signstate.dart';
import 'package:firstproject/server/auth_server.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<signupstates> {
  SignUpCubit() : super(signupinitialstate());

  static SignUpCubit get(context) => BlocProvider.of(context);
  late loginmodel loginmodell;
  final signuperrorstate error=signuperrorstate('failed to sign up ');
  final AuthServer _authServer = AuthServer();
  IconData suffixIcon = Icons.remove_red_eye_outlined;
  bool isObserve = true;

  void changeSuffexIcon() {
    isObserve = !isObserve;
    suffixIcon =
    isObserve ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(RegisersuffixIconState());
  }

  void userSignup({required String email,
    required String password,
    required String name,
    required String phone,
    required String lastname}) {
    _authServer
        .signupWithEmailAndPassword(
        email: email,
        password: password,
        name: name + ' ' + lastname,
        phoneNumber: phone)
        .then((value) {
      value != null
          ? emit(signupsuccessstate(loginmodel.fromJson({
      'status':'singUp',
      'message':'sign up successfully',
      'data':null
      })))
          : emit(error);
    }).catchError((e) {
      error.error=e;
      emit(error);
    });
  }
}
