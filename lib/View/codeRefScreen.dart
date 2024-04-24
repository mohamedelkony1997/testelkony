import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelkony/repositery/paymentcontroller.dart';

import 'package:webview_flutter/webview_flutter.dart';

class CodeRef extends StatelessWidget {
  CodeRef({super.key});
  ItemsDetailsController resDetaildController =
      Get.put(ItemsDetailsController());
  @override
  Widget build(BuildContext context) {
    print(resDetaildController.refCodefinal);
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center
      
      , children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hotels Reservation",
            style: TextStyle(
                color: Color(0xFF2661FA),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFF2661FA),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              'Payment By Code ',
              style:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
        ),
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "you Should go to the Hotel to pay",
                  style: TextStyle(
                      color: Color.fromARGB(255, 151, 149, 149),
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                SizedBox(height: 30),
                Text(
                  "This Reference Code :",
                  style: TextStyle(
                     color: Color.fromARGB(255, 151, 149, 149),
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                SizedBox(height: 33),
                Container(
                  width:250,
                  decoration: BoxDecoration(
                      color: Color(0xFF2661FA),   borderRadius: BorderRadius.all(Radius.circular(10)),),
                  child: Text("${resDetaildController.refCodefinal}",
                  textAlign: TextAlign.center,
                      style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 40)),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
