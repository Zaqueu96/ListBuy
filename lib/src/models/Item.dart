
import 'package:crypto/crypto.dart';

class Item {
  int id;
  String name;
  double price;
  int quantity;
  Item(){
    id = DateTime.now().millisecondsSinceEpoch;
  }
  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
