import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// Widget Input, controls the numbers which are going to be manipulated
class Input extends StatelessWidget {
  var label = ''; // Get a string to define which name the label will have
  var crtl = MoneyMaskedTextController(); // A specific controller for the numbers

  Input({
    @required this.label,
    @required this.crtl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Big Shoulders Display'),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: crtl,
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: 'Big Shoulders Display'),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
