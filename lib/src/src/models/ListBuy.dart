import 'package:listbuy/src/src/models/Item.dart';

class ListBuy{
  int id;
  String name;
  List<Item> itens;
  
  ListBuy(){
    this.itens = [];
  }
   ListBuy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['itens'] != null) {
      itens = new List<Item>();
      json['itens'].forEach((v) {
        itens.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}