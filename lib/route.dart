import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listbuy/main.dart';
import 'package:listbuy/pages/ListPage.dart';
// import 'package:listbuy/pages/List_page.dart';
import 'package:listbuy/pages/home_page.dart';


class Router  {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Homepage());
      case '/lists':
       return MaterialPageRoute(builder: (_) => ListPage());
        
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
} 