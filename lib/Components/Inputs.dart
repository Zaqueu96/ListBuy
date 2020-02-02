import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({@required this.labelText, @required this.oncharge});
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
  final String labelText;
  final Function oncharge;

  InputNumber({@required this.labelText, @required this.oncharge});

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
