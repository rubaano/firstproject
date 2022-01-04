import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cubitt/cubit.dart';
import 'cubitt/states.dart';

class Login extends StatefulWidget {

  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final lastNameController = TextEditingController();

  final passwordController = TextEditingController();

  String? value;

  bool isPassword = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, loginstates>(
        listener: (context, state) {
          if (state is loginsuccessstate) {
            print('is successful');
          }
          if (state is loginsuccessstate) {
            Fluttertoast.showToast(msg: state.loginmodell.message);
            // Toast.show(state.loginmodell.message, context);
          }
          if (state is loginerrorstate) {
            print('4444444444444 ${state.error}');
            // Toast.show(state.error.toString(), context);
              Fluttertoast.showToast(
                  msg: 'state.error.toString()',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 200,
                        child: Image(
                          image: AssetImage('images/goods.jpg'),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'welcome',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40.0,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      defaultfield(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          prefix: Icons.email,
                          label: 'Email',
                          validate: (String? value) {
                            if (value == null) {
                              return 'this field is requierd';
                            }
                            if (value.isEmpty) {
                              return ('Email is too short !');
                            } else if (!(value.contains('@email.com') ||
                                value.contains('@gmail.com'))) {
                              return 'Invalid input';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.deepPurpleAccent,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(LoginCubit.get(context).suffixIcon),
                            onPressed: LoginCubit.get(context).changeSuffexIcon,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('password is too short !');
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      BlocBuilder<LoginCubit, loginstates>(
                        builder: (context, state) => defaultbuttom(
                          text: 'Login',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          radius: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async{
                            var a= await Fluttertoast.showToast(
                                  msg: 'state.error.toString()',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.red,
                                  fontSize: 16.0);
                            },
                            child: const Text(
                              'Forgotten Password',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
