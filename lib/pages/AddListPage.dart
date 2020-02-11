import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/Components/ItemList.dart';
import 'package:listbuy/Dao/DaoListBuy.dart';
import 'package:listbuy/pages/list/AddItens.dart';
import 'package:listbuy/src/src/models/Item.dart';
import 'package:listbuy/src/src/models/ListBuy.dart';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  // List<Item> itens;
  ListBuy listBuy;
  String name;

  @override
  void initState() {
    super.initState();
    setState(() {
      // itens = [];
      listBuy = new ListBuy();
      this.name = "";
    });
    _listLists();
  }

  //Save List Buy
  void _saveList() async {
    DaoListBuy dao = new DaoListBuy();
    int listId = await dao.insert(listBuy);
    print("ID: " + listId.toString());
  }

  //List Lists
  void _listLists() async {
    DaoListBuy dao = new DaoListBuy();
    List<ListBuy> lists = await dao.getAll();
    print(lists.length);
    for (ListBuy list in lists) {
      print("lista nome : " + list.name);
      for (Item i in list.itens) {
        print("item lista: " + i.name);
      }
    }
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
      if (item != null) listBuy.itens.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Nova Lista"),
        actions: <Widget>[
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () => {this._saveList()},
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  )))
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: InputText(
                  labelText: "Nome da Lista",
                  oncharge: ((value) => listBuy.name = value)),
            ),
            // ItemList(item: this.itens[0],)
            Expanded(
              child: ListView.builder(
                itemCount: listBuy.itens.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemList(item: listBuy.itens[index]);
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
