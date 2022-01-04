
import 'package:firebase_core/firebase_core.dart';
import 'package:firstpro/shared/network/remote/dio.dart';
import 'package:bloc/bloc.dart';

import 'package:firstpro/modules/users/user_screen.dart';
import 'package:firstpro/shared/observe.dart';
import 'package:flutter/material.dart';
import 'Login_Screen.dart';
import 'categories/categoriesscreen.dart';
import 'package:http/http.dart' as http;

import 'intro_screen/Intro.dart';
import 'modules/login/loginn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as b;

import 'modules/myaccount.dart';
import 'modules/products/allcanncedfood.dart';
import 'modules/products/makeupdetails.dart';
import 'modules/products/makeupproduct.dart';
import 'modules/products/typepro.dart';
import 'modules/sign up/sign up.dart';
/*void main(){
  runApp(
  GetMaterialApp(initialRoute:'login' ,
  getPages: [
  GetPage(name: 'login', page:()=> Login()),
      GetPage(name: 'intro', page:()=> IntroScreen(),binding: loginbinding()),
    GetPage(name: 'sign up', page:()=> RegisterScreen()),
    GetPage(name: 'productstype', page:()=> productstype()),
    GetPage(name: 'makeupproducts', page:()=> makeupproducts()),
    GetPage(name: 'makeupdetails', page:()=> makeupdetails(image: '', number: '', description: '', name: '',)),
    GetPage(name: 'allcanedfood', page:()=> allcanedfood()),

  ],)
  );




}*/
void main() async{
    WidgetsFlutterBinding.ensureInitialized() ;
    await Firebase.initializeApp();
  b.BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
 // Bloc.observer=MyBlocObserver();
  diohelper.init();
 // runApp( MyApp());
  //MyApp app= MyApp();
 //Widget a=MyApp();
  var res=await http.get(Uri.parse('https://productaaesha.000webhostapp.com/api/categories'));
  print(res);
  print('main');

}
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('myapp');
    return MaterialApp(home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
