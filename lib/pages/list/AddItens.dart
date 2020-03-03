import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/src/models/Item.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  Item produto = null; // Item
  String name = "";
  String quantity = "";
  @override
  void initState() {
    this.produto = new Item();;
    super.initState();
  }

  // Add Attribute
  void _setProduto() {
    setState(() {
      print(this.name + " - " + this.quantity.toString());
      this.produto.name = this.name;
      this.produto.quantity = int.parse(this.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Adicionar item'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            return Container(
                height: 150,
                child: ListView(
                  children: <Widget>[
                    InputText(
                      labelText: "Nome do Item",
                      oncharge: (value) => setState(() {
                        this.name = value;
                      }),
                    ),
                    InputNumber(
                      labelText: "Quantidade(opicional)",
                      oncharge: (value) => setState(() {
                        this.quantity = value;
                      }),
                    ),
                  ],
                ));
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Icon(Icons.add), Text("Adicionar")],
            ),
            onPressed: () {
              _setProduto();
              if (this.produto.name.trim() != '')
                Navigator.of(context).pop(this.produto);
            },
          ),
          FlatButton(
            textColor: Colors.red,
            child: Row(
              children: <Widget>[Icon(Icons.close), Text("Cancelar")],
            ),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
        ],
        contentPadding: EdgeInsets.all(5.0));
  }
}
