import 'package:flutter/material.dart';

enum TypeInput { Text,Number}
class InputText extends StatelessWidget {

  InputText(this.labelText,this.oncharge);
  final String labelText;
  final Function oncharge;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  onChanged: this.oncharge,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: this.labelText),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}

class InputNumber extends StatelessWidget {

  InputNumber(this.labelText,this.oncharge);
  final String labelText;
  final Function oncharge;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: this.oncharge,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: this.labelText),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
