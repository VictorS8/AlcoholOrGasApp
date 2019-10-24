import 'package:flutter/material.dart';

// Widget Logo, represents the logo of the app
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/aog-white.png',
            height: 80.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Álcool ou Gasolina',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Big Shoulders Display',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
      ],
    );
  }
}