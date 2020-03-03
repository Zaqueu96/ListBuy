import 'package:flutter/material.dart';

import '../Components/Card-Custom01.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  static const String routeName = '/home';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: <Widget>[
        Row(
          
          children: <Widget>[
            CardCustom01("Criar Lista", Icons.add,
                (() => {Navigator.of(context).pushNamed('/add-list')})),
            CardCustom01(
                "Iniciar Compra", Icons.view_list, (() => {print("Click Teste")})),        
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
  
      ],
    ));
  }
}
