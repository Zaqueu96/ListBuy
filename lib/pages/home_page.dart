import 'package:flutter/material.dart';
import 'List_page.dart';

import '../Components/Card-Custom01.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  
  @override
  Widget build(BuildContext context) {
        return Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CardCustom01("Criar Lista", Icons.add, (()=>{
                    Navigator.pushNamed(context, '/list')
              })),
            CardCustom01(
                "Compra", Icons.view_list, (() => {print("Click Teste")})),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    ));
  }
}
