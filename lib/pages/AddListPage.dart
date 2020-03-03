import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/Components/ItemList.dart';
import 'package:listbuy/Dao/DaoListBuy.dart';
import 'package:listbuy/pages/list/AddItens.dart';
import 'package:listbuy/src/models/Item.dart';
import 'package:listbuy/src/models/ListBuy.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
      listBuy = new ListBuy();
      this.name = "";
    });
  }

  //Save List Buy
  void _saveList() async {
    DaoListBuy dao = new DaoListBuy();
    int listId = await dao.insert(listBuy);
    print("ID: " + listId.toString());
  }

  //List Lists


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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[50],Colors.blue[100], Colors.blue[200]])
        ),
        child: Column(
          children: <Widget>[ InputText(
                  labelText: "Nome da Lista",
                  oncharge: ((value) => listBuy.name = value)),
            
           Expanded(
             child: ListView.builder(
               itemCount: listBuy.itens.length,
               
               itemBuilder: (BuildContext context, int index) {
                //  return ItemList(item: listBuy.itens[index]);
                Item item  = listBuy.itens[index];
                return Card(
                  
                  child:ListTile(                 
                  title: Row(                     
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(item.name,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlueAccent),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          child:Text(item.quantity.toString())
                          ),
                      )
                    ],
                    ),
                ));
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
