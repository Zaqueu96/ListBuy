// import 'package:listbuy/Dao/DaoListBuy.dart';
import 'package:listbuy/src/models/Item.dart';
// import 'package:listbuy/src/models/ListBuy.dart';

enum  StatusBuy {
  ACTIVE,CANCELED,FINISHED
}

class Buy {
  int id;
  int listId;
  double currencyLimit;
  String location;
  List<Item> extras;
  StatusBuy statusBuy;
  String created;
  String finished;

Buy();

  Buy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    listId = json['listId'];
    currencyLimit = json['currencyLimit'];
    location = json['location'];
    if (json['extras'] != null) {
      extras = new List<Item>();
      json['extras'].forEach((v) {
        extras.add(new Item.fromJson(v));
      });
    }
    statusBuy = json['statusBuy'];
    created = json['created'];
    finished = json['finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['listId'] = this.listId;
    data['currencyLimit'] = this.currencyLimit;
    data['location'] = this.location;
    if (this.extras != null) {
      data['extras'] = this.extras.map((v) => v.toJson()).toList();
    }
    data['statusBuy'] = this.statusBuy;
    data['created'] = this.created;
    data['finished'] = this.finished;
    return data;
  }
}

