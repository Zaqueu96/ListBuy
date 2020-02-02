import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:listbuy/pages/AddListPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lists and Buys',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: 'Listas e Compras'),
        "/add-list": (context) => AddListPage(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    print(index.toString());
    setState(() {
      _selectedIndex = index;
      switch(index){
        case(0):
          Navigator.pushReplacementNamed(context, '/');
          break;

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title: Text(widget.title),
        ),
        body: Center(
          //  child: Navigator( onGenerateRoute: Router.generateRoute),
          child: HomePage(),
        ), // This trailing comma makes auto-formatting nicer for build methods.,
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Dashboard')                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('Listas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('Relatorios'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            backgroundColor: Colors.amber[100],
          ),
        ));
  }
}
