// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:testelkony/View/itemsdetails.dart';
import 'package:testelkony/View/selectedItems.dart';
import 'package:testelkony/bussinesslogic/SignUp/bloc/items_bloc.dart';
import 'package:testelkony/bussinesslogic/SignUp/bloc/items_event.dart';
import 'package:testelkony/consts/colors.dart';
import 'package:testelkony/consts/strings.dart';
import 'package:testelkony/models/itemModel.dart';
import 'package:testelkony/repositery/ItemRepositery.dart';

import '../bussinesslogic/SignUp/bloc/items_state.dart';

class HomeItemsListPage extends StatefulWidget {
  @override
  _HomeItemsListPageState createState() => _HomeItemsListPageState();
}

class _HomeItemsListPageState extends State<HomeItemsListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> _items = [];
  List<Item> _filtereditems = [];
  ValueNotifier<String> _searchQueryNotifier = ValueNotifier<String>('');
  List<Item> _selectedItems = []; // Add this line here

  @override
  void dispose() {
    _searchController.dispose();
    _searchQueryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemBloc = ItemBloc(ItemRepository());
    itemBloc.add(FetchItems());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: Text(
            'Items',
            style: TextStyle(
              color: whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<ItemBloc, ItemState>(
          bloc: itemBloc,
          builder: (context, state) {
            if (state is ItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemLoaded) {
              _items = state.items;
              _filtereditems = _filterRooms(_items, _searchQueryNotifier.value);

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.search,
                            color: darkFontGrey,
                          ),
                        ),
                        hintText: search,
                        hintStyle: TextStyle(color: fontGrey),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 7.0,
                        ),
                        filled: true,
                        fillColor: textfieldGrey,
                      ),
                      onChanged: (query) {
                        _searchQueryNotifier.value = query;
                      },
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _searchQueryNotifier,
                      builder: (context, query, _) {
                        _filtereditems = _filterRooms(_items, query);
                        return _filtereditems.isEmpty
                            ? Center(child: Text('No data matched'))
                            : ListView.builder(
                                itemCount: _filtereditems.length,
                                itemBuilder: (context, index) {
                                  final item = _filtereditems[index];
                                  return ItemWidget(
                                      item: item,
                                      selectedItems: _selectedItems);
                                  // Pass selectedItems here
                                },
                              );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ItemError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
                  child: Text('Something went wrong Check Connection'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
    if (_selectedItems.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedItemsPage(selectedItems: _selectedItems),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No items selected'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
          child: Stack(
            children: [
              Icon(Icons.shopping_cart),
              if (_selectedItems.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                    
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Item> _filterRooms(List<Item> rooms, String query) {
    query = query.toLowerCase();
    if (query.isEmpty) {
      return rooms;
    } else {
      return rooms.where((room) {
        return room.name.toLowerCase().contains(query) ||
            room.price.toString().contains(query);
      }).toList();
    }
  }
}
