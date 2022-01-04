
import 'package:firebase_core/firebase_core.dart';
import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'intro_screen/Intro.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as b;


void main() async{
    WidgetsFlutterBinding.ensureInitialized() ;
    await Firebase.initializeApp();
    // diohelper.init();
  b.BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );

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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
