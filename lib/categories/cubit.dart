import 'package:bloc/bloc.dart';
import 'package:firstpro/model/login_model.dart';




import 'package:firstpro/modules/login/cubitt/states.dart';
import 'package:firstpro/enddd/end_point.dart';
import 'package:firstpro/modules/sign%20up/cubit/signstate.dart';

import 'package:firstpro/shared/network/remote/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class signupcubit extends Cubit<signupstates>{
  signupcubit() : super(signupinitialstate());
  static signupcubit get(context)=>BlocProvider.of(context);
  late loginmodel loginmodell;
  IconData suffixIcon=Icons.remove_red_eye_outlined;
  bool isObserve=true;
  void changeSuffexIcon(){
    isObserve=!isObserve;
    suffixIcon=isObserve?Icons.remove_red_eye_outlined:Icons.visibility_off;
    emit(RegisersuffixIconState());

  }
  void usersignup({required String email,required String password,required String name,required String phone ,required String lastname}){
    diohelper.postdata(url:SIGNUP , data: {
      'email':email,
      'password':password,
      'name':name,
      'lastname':lastname,
      'phone':phone,
    },
    ).then((value) {
      print(value.data);
      loginmodell=  loginmodel.fromJson(value.data);
      print(loginmodell.status);
      print(loginmodell.message);
      print(loginmodell.data.Token);
      emit(signupsuccessstate(loginmodell));
    }).catchError((error){
      print(error.toString());
      emit(signuperrorstate(error.toString()));
    });
  }
}