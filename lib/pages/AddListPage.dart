import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/Components/ItemList.dart';
import 'package:listbuy/pages/list/AddItens.dart';
import 'package:listbuy/src/src/models/Item.dart';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  List<Item> itens;

  @override
  void initState() {
    super.initState();
    setState(() {
      itens = [];
      Item i = new Item();
      i.name = "Zaqueu Ps";
      i.quantity = 12;
      itens.add(i);
    });
  }

  // Modal Add Item List
  void _add() async {
    Item item = await showDialog<Item>(
      context: context,
      builder: (BuildContext context) {
        return AddItem();
      },
    );
    setState(() {
      print(item.quantity);
      if (item != null) itens.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criar Nova Lista")),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: InputText(
                  labelText: "Nome da Lista",
                  oncharge: ((value) => {print(value)})),
            ),
            // ItemList(item: this.itens[0],)
            Expanded(
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemList(item: itens[index]);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {this._add()},
      ),
    );
  }
}
