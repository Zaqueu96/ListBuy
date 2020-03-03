import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
class InputText extends StatelessWidget {
  InputText({@required this.labelText, @required this.oncharge});
  final String labelText;
  final Function oncharge;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  // maxLength: 25,
                 textCapitalization: TextCapitalization.words,
                  onChanged: this.oncharge,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: this.labelText),
                  style: TextStyle(
                      fontWeight: FontWeight.w800,)
                      ),
                ),
              )
        ],
      ),
    );
  }
}

class InputNumber extends StatelessWidget {
  final String labelText;
  final Function oncharge;

  InputNumber({@required this.labelText, @required this.oncharge});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: this.oncharge,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: this.labelText),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}


class InputMoney extends StatelessWidget {
  final String labelText;
  final Function oncharge;

  InputMoney({@required this.labelText, @required this.oncharge});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: this.oncharge,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: this.labelText),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    CurrencyPtBrInputFormatter()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}


/** Format Current Money */
class CurrencyPtBrInputFormatter extends TextInputFormatter {
  CurrencyPtBrInputFormatter({this.maxDigits});
  final int maxDigits;

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (maxDigits != null && newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    final formatter = new NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ " + formatter.format(value / 100);
    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
