

import 'package:firstproject/model/login_model.dart';

abstract class loginstates{}
class logininitialstate extends loginstates{}

class loginloadingstate extends loginstates{


}
class suffixIconState extends loginstates{}

class loginsuccessstate extends loginstates{
   final loginmodel loginmodell;
  loginsuccessstate(this.loginmodell);
}

class loginerrorstate extends loginstates{

  final String error;
  loginerrorstate(this.error);
}
