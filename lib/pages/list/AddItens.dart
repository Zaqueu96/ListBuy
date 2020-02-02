import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/src/src/models/Item.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  Item produto; // Item
  String name;
  int quantity;
  @override
  void initState() {
    super.initState();
    setState(() {
      this.produto = new Item();
    });
  }

  // Add Attribute
  void _setProduto() {
    setState(() {
      print(this.name + " - " + this.quantity.toString());
      this.produto.name = this.name;
      this.produto.quantity = this.quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Add item'),
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
                  oncharge: ((value) => {
                        setState(() {
                          print(value);
                          this.name = value;
                        })
                      }),
                ),
                InputNumber(
                  labelText: "Quantidade(opicional)",
                  oncharge: ((value)  {
                        setState(() {
                          this.quantity = value;
                          print("sss : "+this.quantity.toString());
                        });
                      }),
                ),
              ],
            )
            );
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
