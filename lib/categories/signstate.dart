

import 'package:firstproject/model/login_model.dart';

abstract class signupstates{}
class signupinitialstate extends signupstates{}

class signuploadingstate extends signupstates{


}
class RegisersuffixIconState extends signupstates{}
class signupsuccessstate extends signupstates{
  late final loginmodel loginmodell;
  signupsuccessstate(this.loginmodell);
}

class signuperrorstate extends signupstates {

  final String error;
  signuperrorstate(this.error);
}