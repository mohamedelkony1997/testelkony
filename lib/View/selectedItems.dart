import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelkony/View/paymentWays.dart';
import 'package:testelkony/consts/colors.dart';
import 'package:testelkony/models/itemModel.dart';

class SelectedItemsPage extends StatelessWidget {
  final List<Item> selectedItems;

  const SelectedItemsPage({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    int totalItems = selectedItems.length;

    // Calculate total price
    selectedItems.forEach((item) {
      totalPrice += double.parse(item.price);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: Text(
            'Selected Items',
            style: TextStyle(
              color: whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: ListView.builder(
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    final item = selectedItems[index];
                    return Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                              item.name,
                              style: TextStyle(
                                color: darkFontGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '\$${item.price.toString()}',
                              style: TextStyle(
                                color: redColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total Items: $totalItems',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: redColor),
                    ),
                  ),
                ],
              ),
               ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(100, 50)),
                backgroundColor: MaterialStateProperty.all(
                  green,
                ),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                
                  Get.to(PaymentMethods());
               
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
