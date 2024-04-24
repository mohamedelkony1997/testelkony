import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelkony/View/cardScreen.dart';
import 'package:testelkony/View/codeRefScreen.dart';

import 'package:testelkony/consts/colors.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hotels Reservation",
            style: TextStyle(
                color: green,
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
              'Payment Methods',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: InkWell(
            onTap: () {
              Get.to(CodeRef());
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset("assets/images/phone.png"),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: InkWell(
            onTap: () {
              Get.to(CardScreen());
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset("assets/images/debit-card.png"),
            ),
          ),
        )
      ]),
    ));
  }
}
