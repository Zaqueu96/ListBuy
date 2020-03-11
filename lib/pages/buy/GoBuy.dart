import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
// import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listbuy/Components/FancyBackgroundApp.dart';
import 'package:listbuy/Dao/DaoBuyList.dart';
import 'package:listbuy/Dao/DaoListBuy.dart';
import 'package:listbuy/pages/buy/BuyList.dart';
import 'package:listbuy/src/models/Buy.dart';
import 'package:lottie/lottie.dart';

class GoBuy extends StatefulWidget {
  final int buyId;
  GoBuy({Key key, @required this.buyId}) : super(key: key);
  @override
  _GoBuyState createState() => _GoBuyState();
}

class _GoBuyState extends State<GoBuy> {
  ValueNotifier<double> notifiQte = ValueNotifier<double>(0.0);
  Buy _buyList;
  DaoBuyList _dao;
  int _selectedIndex = 0;
  int contador = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    this._dao = new DaoBuyList();
    loadBuyList();
  }

  void loadBuyList() async {
    _buyList = await this._dao.getById(widget.buyId);
    print(_buyList.location);
  }

  void _onItemTapped(int index) {
    print(index.toString());
    setState(() {
      contador++;
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomBackground(0),
        bottomNavigationBar: customBottomNavigationBar(),
        body: Stack(
          children: <Widget>[
            Positioned.fill(child: FancyBackgroundApp()),
            FractionallySizedBox(
              heightFactor: 0.3,
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 35, right: 15),
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: Row(
                        children: <Widget>[
                          Lottie.asset("lottie/bag.json", height: 89),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Chip(
                                padding: EdgeInsets.only(right: 15),
                                avatar: CircleAvatar(
                                  backgroundColor: Colors.grey.shade800,
                                  child: Text("R\$"),
                                ),
                                label: Text('2000.00'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))),
            PageView(
              controller: _pageController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.clip,
                      children: <Widget>[
                        CircleAvatar(child: Icon(Icons.shopping_cart)),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 3, right: 3, top: 1, bottom: 1),
                                  child: Text('$contador')),
                            ))
                      ],
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: Text("Carrinho de Compra"),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: Text("Configuration"),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Widget customBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: _selectedIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: _onItemTapped,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text(
            'Lista',
            style: TextStyle(fontSize: 12),
          ),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: IconsCustom(Icons.shopping_cart, contador),
            title: Text(
              'Carrinho',
              style: TextStyle(fontSize: 12),
            ),
            activeColor: Colors.purpleAccent),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              'Configuração',
              style: TextStyle(fontSize: 12),
            ),
            activeColor: Colors.blue),
      ],
    );
  }
}

class IconsCustom extends Icon {
  final int count;
  IconsCustom(IconData icon, @required this.count) : super(icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Expanded(
        child: Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        CircleAvatar(child: Icon(Icons.shopping_cart)),
        Positioned(
            top: 0,
            right: 6,
            child: Container(
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Text(
                    '${this.count}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ))
      ],
    ));
  }
}

class CustomBackground extends Color {
  CustomBackground(int value) : super(value);

  @override
  Widget build(BuildContext context) {
    return FancyBackgroundApp();
  }
}
