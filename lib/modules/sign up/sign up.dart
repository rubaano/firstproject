
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'cubit/cubit.dart';
import 'cubit/signstate.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var firstnameController= TextEditingController();

  var lastNameController= TextEditingController();

  var emailController= TextEditingController();

  var passwordController= TextEditingController();

  var numberController= TextEditingController();

  bool isPassword = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, signupstates>(
      listener: (context, state) {
        if (state is signupsuccessstate) {

          print('is successful');
        }
        if (state is signupsuccessstate) {
          // Toast.show(state.loginmodell.message, context);
          Fluttertoast.showToast(msg: state.loginmodell.message);

        }
        if(state is signuperrorstate){
          // Toast.show(state.error.toString(), context);
          setState(() {
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          });
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [

                      const  Image(
                          image: AssetImage('images/flower.png'),

                          height:130.0,
                          width:300.0,
                          fit:BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                        const  SizedBox(
                          height:25.0,
                        ),
                        const  Text('Sign Up',
                            style: TextStyle(
                              fontSize:40.0,
                              fontWeight:FontWeight.w800,
                              color: Colors.deepPurpleAccent,
                              //fontStyle: FontStyle.italic,
                            )
                        ),
                        const SizedBox(
                          height:15.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: defaultfield(
                                  controller: firstnameController,
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
                              const    SizedBox(
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

                        const  SizedBox(
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
                        const  SizedBox(
                          height:10.0,
                        ),

                        defaultfield(type: TextInputType.visiblePassword,
                          controller: passwordController,
                          prefix: Icons.lock,

                          label: 'password',
                          suffix: isPassword ? Icons.visibility : Icons
                              .visibility_off,
                          ispassword: isPassword,
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
                        const  SizedBox(
                          height:10.0,
                        ),
                       defaultfield(
                          controller: numberController,
                          type: TextInputType.number,
                          validate: (value)
                          {
                            if (value.isEmpty){
                              return (' what is your number?');
                            }
                            return null;
                          },

                          label: 'Number',

                         prefix: Icons.phone,

                        ),
                        const  SizedBox(
                          height:15.0,
                        ),

                BlocBuilder<SignUpCubit, signupstates>(
                    builder: (context,state)=>
                        defaultbuttom(
                          text: 'Login',
                          function: () {
                            if(formKey.currentState!.validate()){

                              SignUpCubit.get(context).userSignup(
                                  email: emailController.text,
                                  password: passwordController.text,
                                name:firstnameController.text,
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
