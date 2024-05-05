import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class CheckoutPage extends StatefulWidget {
  final double totalPrice;
  final List items;
  CheckoutPage({Key? key, required this.totalPrice, required this.items});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "PayPal Checkout",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              List<Map<String, dynamic>> itemList = [];

              // Populate itemList with selected items
              for (var item in widget.items) {
                itemList.add({
                  "name": item.name,
                  "quantity": 1,
                  "price": item.price,
                  "currency": "USD"
                });
              }

              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckout(
                  sandboxMode: true,
                  clientId:
                      "ASB-kYulzjkzeaBsEM3S3XBzBObtCSOKeFLkMpfsPavm5VmhgB21NRE2f8dMhMk8PPEurwt1NOK3vyHF",
                  secretKey:
                      "ENV0FZ-3-CHg3oDmTeLXhREhEszw_mR7L995Vc1crAQi72o_8F3t6GZn8Fp9IH4j7G-yh1zhYDbCa7XV",
                  returnURL: "success.snippetcoder.com",
                  cancelURL: "cancel.snippetcoder.com",
                  transactions: [
                    {
                      "amount": {
                        "total": '${widget.totalPrice.toString()}',
                        "currency": "USD",
                        "details": {
                          "subtotal": '${widget.totalPrice.toString()}',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      "item_list": {
                        "items": itemList, // Use itemList here
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                  },
                ),
              ));
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(1),
                ),
              ),
            ),
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
