import 'package:flutter/material.dart';
import 'package:listbuy/pages/list/Add.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Column(
        children: <Widget>[AddList()],
      ),
    ));
  }
}
