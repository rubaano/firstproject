import 'package:bloc/bloc.dart';
import 'package:firstpro/model/login_model.dart';




import 'package:firstpro/modules/login/cubitt/states.dart';
import 'package:firstpro/enddd/end_point.dart';

import 'package:firstpro/shared/network/remote/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class logincubit extends Cubit<loginstates>{
  logincubit() : super(logininitialstate());
  static logincubit get(context)=>BlocProvider.of(context);
  late loginmodel loginmodell;
  IconData suffixIcon=Icons.remove_red_eye_outlined;
  bool isObserve=true;
  void changeSuffexIcon(){
    isObserve=!isObserve;
    suffixIcon=isObserve?Icons.remove_red_eye_outlined:Icons.visibility_off;
    emit(suffixIconState());

  }
  void userlogin({required String email,required String password}){
    diohelper.postdata(url: LOGIN, data: {
      'email':email,
      'password':password,
    },
    ).then((value) {
      print(value.data);
   loginmodell=  loginmodel.fromJson(value.data);
print(loginmodell.status);
print(loginmodell.message);
print(loginmodell.data.Token);
    emit(loginsuccessstate(loginmodell));
    }).catchError((error){
      print(error.toString());
      emit(loginerrorstate(error.toString()));
    });
  }
}