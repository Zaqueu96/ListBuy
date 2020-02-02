import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/Components/ItemList.dart';
import 'package:listbuy/pages/list/AddItens.dart';
import 'package:listbuy/src/src/models/Item.dart';

class AddList extends StatefulWidget {
  AddList({Key key}) : super(key: key);

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  List<Item> itens;

  @override
  void initState() {
    super.initState();
    setState(() {
      itens = [];
    });
  }

  // Modal Add Item List
  add() async {
    Item item = await showDialog<Item>(
      context: context,

      builder: (BuildContext context) {
        // return Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(100))
        //   ),
        //   width: 100,
          // child: AddItem());
        return AddItem();
      },
    );
    setState(() {
      if (item != null) itens.add(item);
    });
    print(itens.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        child: InputText(
            labelText: "Nome da Lista", oncharge: ((value) => {print(value)})),
      ),
      FlatButton(child: Text("Adicionar Itens"), onPressed: (() => {add()})),
      // ListView.builder(
      //   padding: EdgeInsets.all(5.0),
      //   itemCount: itens.length,
      //   itemBuilder: (BuildContext context,int index){
      //     return ItemList(item: itens[index]);
      //   },
      // ),
    ]);
  }
}
