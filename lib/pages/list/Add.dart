import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/pages/list/AddItens.dart';
import 'dart:async';

class AddList extends StatefulWidget {
  AddList({Key key}) : super(key: key);

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  // Modal Add Item List
  Future<void> showModal() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddItem();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Column(
      children: <Widget>[
        InputText("Nome", ((value) => {print("String: " + value)})),
        FlatButton(child: Text("Modal Show"), onPressed: (() => {showModal()}))
      ],
    )));
  }
}
