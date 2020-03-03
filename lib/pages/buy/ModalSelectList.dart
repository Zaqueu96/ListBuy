
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listbuy/Components/Inputs.dart';
import 'package:listbuy/Dao/DaoBuyList.dart';
import 'package:listbuy/src/models/Buy.dart';
import 'package:listbuy/src/models/ListBuy.dart';
import 'package:lottie/lottie.dart';
class ModalSelectList extends StatefulWidget {
  final ListBuy list;
  ModalSelectList({Key key,@required this.list}):super(key:key);
  @override
  _ModalSelectListState createState() => _ModalSelectListState();
}

class _ModalSelectListState extends State<ModalSelectList> {
 DaoBuyList dao;
 Buy buylist;
  @override
  void initState() {
    super.initState();
    buylist = new Buy();
    buylist.listId = widget.list.id;
    dao = new DaoBuyList();
    // lists();
  }

  Future lists(int id) async{
    Buy b = await dao.getById(id);
    print(b.location);
  }
  Future saveBuy() async{
    int id = await dao.insert(buylist);
    await lists(id);
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vamos as Compras",
          style: GoogleFonts.lora(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        centerTitle: true,
        leading: GestureDetector(
          child: CircleAvatar(
            child: Icon(Icons.close),
            backgroundColor: Colors.white,
          ),
          onTap: () => {Navigator.of(context).pop(null)},
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset("lottie/animation_list.json",
                height: MediaQuery.of(context).size.height / 2.2),
            Container(
              margin: EdgeInsets.only(bottom: 20),
                child: Text(
              "${widget.list.name}",
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold, fontSize: 25,
                  color: Colors.blueAccent[500]),
            )

            ),
            InputText(
              labelText: "Local onde deseja Comprar?",
              oncharge: (v) => {buylist.location = v},
            ),
            InputMoney(
              labelText: "Quanto pretende gastar nessa compra?",
              oncharge: (v) => {buylist.currencyLimit = double.parse(v)},
            ),
            FlatButton.icon(
                padding: EdgeInsets.all(5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                icon: Icon(Icons.check),
                color: Colors.amberAccent,
                onPressed: () async => { await saveBuy()},
                label: Text(
                  "Vamos lá",
                  style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold),
                ))

          ]),
    );

  }
}


