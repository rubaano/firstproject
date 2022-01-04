import 'package:firstpro/modules/products/typepro.dart';
import 'package:firstpro/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/widgets/form.dart';
import 'cubitt/cubit.dart';
import 'cubitt/states.dart';

class Login extends StatelessWidget {
  //State<Login> createState() => _LoginState();
  dynamic emailController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();

  dynamic passwordController = TextEditingController();

  String? value;

  bool ispassword = true;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<logincubit, loginstates>(
      listener: (context, state) {
        if (state is loginsuccessstate) {
          print('is successful');
        }
        if (state is loginsuccessstate) {
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
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: Image(
                          image: AssetImage('images/goods.jpg'),
                        ),
                      ),
                      Center(
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
                      SizedBox(
                        height: 40.0,
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
                        height: 15.0,
                      ),

                      TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onFieldSubmitted: (String value){
                            print(value);
                          },
                          onChanged: (String value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                           color: Colors.deepPurpleAccent, ),
                            suffixIcon:IconButton(
                              icon: Icon(logincubit.get(context).suffixIcon),
                              onPressed:logincubit.get(context).changeSuffexIcon,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: ( value)
                          {
                            if (value!.isEmpty){
                              return ('password is too short !');
                            }

                            return null;
                          },


                      ),


                      SizedBox(
                        height: 20.0,
                      ),
                      BlocBuilder<logincubit, loginstates>(
                        builder: (context, state) =>
                            defaultbuttom(
                          text: 'Login',
                          function: () {
                            if(formkey.currentState!.validate()){

                              logincubit.get(context).userlogin(
                                  email: emailController.text,
                                  password: passwordController.text);

                            };


                          },

                          radius: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgotten Password',
                              style:
                              TextStyle(color: Colors.deepPurpleAccent),
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
        )
    );
  }
}
