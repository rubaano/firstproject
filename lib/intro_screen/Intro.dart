import 'package:firstpro/categories/categoriesscreen.dart';
import 'package:firstpro/categories/shopcubit.dart';
import 'package:firstpro/modules/login/cubitt/cubit.dart';
import 'package:firstpro/modules/products/makeupproduct.dart';
import 'package:firstpro/modules/products/typepro.dart';
import 'package:firstpro/modules/sign%20up/cubit/cubit.dart';
import 'package:firstpro/modules/sign%20up/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login_Screen.dart';
import '../modules/login/loginn.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('intro screen');
    return Scaffold(
      body: Column(children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.white38,
            image: new DecorationImage(
              image: AssetImage("images/goods.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider<logincubit>(
                                  create: (context) => logincubit(),
                                  child: Login(),
                                )),
                      );
                    },
                    child: Text(
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<signupcubit>(
                            create: (context) => signupcubit(),
                            child: RegisterScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text(
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
                /*   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.pinkAccent,
                    child: MaterialButton(
                      onPressed: () {

                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LoginScreen(),
                          ),
                        );


                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ]
            ),*/
              ]),
        ),
      ]),
    );
  }
}
