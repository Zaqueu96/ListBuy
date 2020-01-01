import 'package:flutter/material.dart';
import 'package:listbuy/Components/Inputs.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String teamName;
    return  AlertDialog(
        title: Text('Enter current team'),
        content:  Row(          
          children: <Widget>[
            InputText("Nome do Item",(v)=>{ print(v)})
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
  }
}
