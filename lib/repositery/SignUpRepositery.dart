import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelkony/consts/firebase_consts.dart';

import 'package:velocity_x/velocity_x.dart';

class RegisterController extends GetxController {
  var isloadind = false.obs;
  var emailConroller = TextEditingController();
  var passwordConroller = TextEditingController();

  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  storeUserdate({name, email, address, phone}) async {
    DocumentReference store =
        await firestore.collection(usercollection).doc(user!.uid);
    store.set({
      "Name": name,
      "Email": email,
      "Phone": phone,
      "Address": address,
    });
  }
}
