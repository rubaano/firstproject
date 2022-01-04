import 'package:firstpro/modules/products/typepro.dart';
import 'package:firstpro/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cubit/cubit.dart';
import 'cubit/signstate.dart';

class RegisterScreen extends StatelessWidget {
  var FirstnameController= TextEditingController();
  var lastNameController= TextEditingController();
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var numberController= TextEditingController();
  bool ispassword = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return BlocListener<signupcubit, signupstates>(
      listener: (context, state) {
        if (state is signupsuccessstate) {

          print('is successful');
        }
        if (state is signupsuccessstate) {
          if (state.loginmodell.status) {
            print(state.loginmodell.message);

            print(state.loginmodell.data.Token);

            Fluttertoast.showToast(
                msg: state.loginmodell.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            print(state.loginmodell.message);
            Fluttertoast.showToast(
                msg: state.loginmodell.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },

        child:  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
            ),

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [

                        Image(
                          image: AssetImage('images/flower.png'),

                          height:130.0,
                          width:300.0,
                          fit:BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height:25.0,
                        ),
                        Text('Sign Up',
                            style: TextStyle(
                              fontSize:40.0,
                              fontWeight:FontWeight.w800,
                              color: Colors.deepPurpleAccent,
                              //fontStyle: FontStyle.italic,
                            )
                        ),
                        SizedBox(
                          height:15.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: defaultfield(
                                  controller: lastNameController,
                                  type: TextInputType.name,
                                  validate: (value)
                                  {
                                    if (value.isEmpty){
                                      return (' what is your name?');
                                    }
                                    return null;
                                  },

                                  label: 'First Name',



                                ),
                              ),
                              SizedBox(
                                width:10.0,
                              ),
                              Expanded(
                                child: defaultfield(
                                  controller: lastNameController,
                                  type: TextInputType.name,
                                  validate: (value)
                                  {
                                    if (value.isEmpty){
                                      return (' what is your name?');
                                    }
                                    return null;
                                  },

                                    label: 'Last Name',



                                ),
                              ),

                            ]
                        ),

                        SizedBox(
                          height:10.0,
                        ),

                        defaultfield(
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            prefix: Icons.email,
                            label: 'Email',
                            validate: (value)
                            {
                              if (value.isEmpty){
                                return ('Email is too short !');
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height:10.0,
                        ),

                        defaultfield(type: TextInputType.visiblePassword,
                          controller: passwordController,
                          prefix: Icons.lock,

                          label: 'password',
                          suffix: ispassword ? Icons.visibility : Icons
                              .visibility_off,
                          ispassword: ispassword,
                          suffixpressed: () {

                          },

                            validate: (value)
                            {
                              if (value.isEmpty){
                                return ('passwordis too short !');
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height:10.0,
                        ),
                       defaultfield(
                          controller: numberController,
                          type: TextInputType.number,
                          validate: (value)
                          {
                            if (value.isEmpty){
                              return (' what is your name?');
                            }
                            return null;
                          },

                          label: 'Number',

                         prefix: Icons.phone,

                        ),
                        SizedBox(
                          height:15.0,
                        ),

                BlocBuilder<signupcubit, signupstates>(
                    builder: (context,state)=>
                        defaultbuttom(
                          text: 'Login',
                          function: () {
                            if(formkey.currentState!.validate()){

                              signupcubit.get(context).usersignup(
                                  email: emailController.text,
                                  password: passwordController.text,
                                name:FirstnameController.text,
                                  lastname: lastNameController.text,
                                  phone: numberController.text,

                                 );
                            };

                          },
                          radius: 15,
                        ),
                ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          )


      );

  }
}
