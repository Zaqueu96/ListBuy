import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/pages/buy/ModalSelectList.dart';
import 'package:listbuy/src/models/ListBuy.dart';
import 'package:listbuy/Dao/DaoListBuy.dart';
import 'dart:math';

import 'package:lottie/lottie.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<ListBuy> listsBuys;
  @override
  void initState() {
    super.initState();
    listsBuys = new List<ListBuy>();
    getLists();
  }

  Future<void> getLists() async {
    DaoListBuy dao = new DaoListBuy();
    final result = await dao.getAll();
    setState(() {
      listsBuys = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: ListView(
          children: listsBuys.map((e) => getListaWidget(e)).toList(),
        ))
      ],
    );
  }

  Widget getListaWidget(ListBuy lista) {
    List<IconData> icons = [
      Icons.shopping_basket,
      Icons.fastfood,
      Icons.free_breakfast,
      Icons.shop,
      Icons.star,
      Icons.all_inclusive,
      Icons.apps,
      Icons.local_pizza
    ];
    Random randomize = new Random();
    int icon = randomize.nextInt(icons.length);
    return GestureDetector(
        onTap: () async => {dialogoOne(context, lista)},
        child: Card(
            child: ListTile(
                leading: Icon(icons[icon]),
                title: Text(lista.name),
                subtitle: Text("Quantidade de Items " +
                    lista.itens.length.toString() +
                    " - id " +
                    lista.id.toString()))));
  }

  void dialogoOne(BuildContext context, ListBuy list) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => ModalSelectList(list:list)));
  }
}
