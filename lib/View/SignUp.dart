// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testelkony/View/Login.dart';



import 'package:testelkony/consts/colors.dart';
import 'package:testelkony/consts/strings.dart';
import 'package:testelkony/repositery/Login.dart';
import 'package:testelkony/repositery/SignUpRepositery.dart';
import 'package:velocity_x/velocity_x.dart';


class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
late final RegisterController controller;
  TextEditingController emailCon = TextEditingController();

  TextEditingController addressCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  bool isSeen = true;
 @override
  void initState() {
    super.initState();
    controller = Get.put(RegisterController());
  }
  @override
  Widget build(BuildContext context) {
     
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child:  ListView(
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
                          signupac,
                          style: TextStyle(
                            color: darkFontGrey,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      fname,
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
                    controller: nameCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.person,
                          color: darkFontGrey,
                        ),
                      ),
                      hintText: namehint,
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
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      address,
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
                    controller: addressCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.location_on,
                          color: darkFontGrey,
                        ),
                      ),
                      hintText: addresshint,
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
                        return 'Please enter address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      phone,
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
                    controller: phoneCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.phone,
                          color: darkFontGrey,
                        ),
                      ),
                      hintText: phoneh,
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
                        return 'Please enter phone';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 65),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    await controller.signUpMethod(
                      context: context,
                      email: emailCon.text,
                      password: passwordCon.text,
                    ).then((value) {
                      return controller.storeUserdate(
                        name: nameCon.text,
                        email: emailCon.text,
                        phone: phoneCon.text,
                        address: addressCon.text,
                      );
                    }).then((value) {
                 Get.to(LoginScreen(authRepository: AuthRepository()));
                      VxToast.show(context, msg: "Registered");
                    });
                  } catch (e) {
                    VxToast.show(context, msg: e.toString());
                  }
          
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        signup,
                        style: TextStyle(fontSize: 18, color: whiteColor),
                      ),
                    ),
                  ),
                ],
              )
            
          ),
        ),
      ),
    );
  }
}
