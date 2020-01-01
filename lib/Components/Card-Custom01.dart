import 'package:flutter/material.dart';

class CardCustom01 extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function callback;

  CardCustom01(this.title, this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.callback,
        child: Container(
          width: 100.0,
          child: Card(            
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  Icon(
                    this.icon,
                    size: 50,
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])))));
  }
}
