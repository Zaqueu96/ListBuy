import 'package:flutter/material.dart';
import 'package:listbuy/src/src/models/Item.dart';

class ItemList extends StatefulWidget {

  final Item item;
  const ItemList({Key key, @required  this.item});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  String _prefix;
  @override
  void initState() {
    super.initState();
    setState(() {
      this._prefix = this._getPrefix(widget.item.name);
    });
  }

  String _getPrefix(String text) {
    List<String> list_str = text.toUpperCase().split(" ");
    if (list_str.length > 1) return (list_str[0][0] + list_str[1][0]);
    return (list_str[0][0] + list_str[0][1]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(this._prefix),
            ),
          ],
        ),
        Expanded(
          flex: 2,
          child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0)),
              padding: EdgeInsets.all(10.0),
              child: Text(widget.item.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
              )),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.lightGreen[400],
                  borderRadius: BorderRadius.circular(50.0)
                  ),
              padding: EdgeInsets.all(10.0),
              child: Text(widget.item.quantity.toString(),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String text;

  const _Item({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(this.text),
    );
  }
}
