import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testelkony/consts/colors.dart';
import 'package:testelkony/models/itemModel.dart';

class ItemWidget extends StatefulWidget {
  final Item item;
  final List<Item> selectedItems; // Define selectedItems here

  const ItemWidget({Key? key, required this.item, required this.selectedItems}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.network(
                      widget.item.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Checkbox(
                    value: _isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _isSelected = value ?? false;
                        if (_isSelected) {
                          widget.selectedItems.add(widget.item); // Add item to selectedItems list
                          print(widget.selectedItems); // Print the length of selected items
                        } else {
                          widget.selectedItems.remove(widget.item); // Remove item from selectedItems list
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      color: darkFontGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${widget.item.price}',
                    style: TextStyle(
                      color: redColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                widget.item.description,
                style: TextStyle(
                  color: darkFontGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
