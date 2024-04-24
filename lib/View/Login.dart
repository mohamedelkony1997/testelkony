// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:testelkony/View/ItemsScreen.dart';
import 'package:testelkony/View/SignUp.dart';
import 'package:testelkony/bussinesslogic/SignUp/bloc/items_bloc.dart';


import 'package:testelkony/bussinesslogic/loginbloc/login_bloc.dart';
import 'package:testelkony/bussinesslogic/loginbloc/login_event.dart';
import 'package:testelkony/bussinesslogic/loginbloc/login_state.dart';
import 'package:testelkony/consts/colors.dart';
import 'package:testelkony/consts/strings.dart';
import 'package:testelkony/repositery/ItemRepositery.dart';
import 'package:testelkony/repositery/Login.dart';

import 'package:testelkony/repositery/SignUpRepositery.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;

  LoginScreen({required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRepository: authRepository),
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  bool isSeen = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Get.to(BlocProvider(
                    create: (context) => ItemBloc(ItemRepository()),
                    child: HomeItemsListPage(),
                  ));
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            acount_login,
                            style: TextStyle(
                              color: darkFontGrey,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Image(
                        image: AssetImage("assets/images/login.png"),
                        width: 280,
                        height: 230,
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        email,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: darkFontGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.email_outlined,
                            color: darkFontGrey,
                          ),
                        ),
                        hintText: emailHint,
                        hintStyle: TextStyle(color: fontGrey),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 7.0,
                        ),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        password,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: darkFontGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.password,
                            color: darkFontGrey,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isSeen = !isSeen;
                            });
                          },
                          child: Icon(
                            isSeen ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 6.0,
                        ),
                        hintText: "$password",
                        hintStyle: TextStyle(color: fontGrey),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: isSeen,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                alreadyHaveAccount,
                                style: TextStyle(
                                  color: darkFontGrey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                signup,
                                style: TextStyle(
                                  color: green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all(green),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(
                                email: emailCon.text,
                                password: passwordCon.text,
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Network error: Please check your internet connection."),
                              ),
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          login,
                          style: TextStyle(fontSize: 18, color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
