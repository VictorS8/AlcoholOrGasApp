import 'package:aog/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

// Widget Sucess, is for show which type of alcohol or gas will be better option
class Sucess extends StatelessWidget {
  var result = ''; // Result that will appear
  Function reset; // A function to reset the numbers

  Sucess({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: 'Big Shoulders Display',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            func: reset, 
            text: 'Calcular novamente',
            invert: true,
          ),
        ],
      ),
    );
  }
}
