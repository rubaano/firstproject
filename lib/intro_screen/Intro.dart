
import 'package:firstproject/categories/shopcubit.dart';
import 'package:firstproject/modules/login/cubitt/cubit.dart';
import 'package:firstproject/modules/products/typepro.dart';
import 'package:firstproject/modules/sign%20up/cubit/cubit.dart';
import 'package:firstproject/modules/sign%20up/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/login/loginn.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({ Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        //for image
        Container(
          height: 450,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.white38,
            image:  DecorationImage(
              image: AssetImage("images/goods.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // for buttons
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<ShopCubit>(
                            create: (context) => ShopCubit()..getCategories(),
                            child: productstype(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Shopping NOW',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: background,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider<LoginCubit>(
                                  create: (context) => LoginCubit(),
                                  child: Login(),
                                )),
                      );
                    },
                    child:const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: background,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<SignUpCubit>(
                            create: (context) => SignUpCubit(),
                            child: RegisterScreen(),
                          ),
                        ),
                      );
                    },
                    child:const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: background,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
