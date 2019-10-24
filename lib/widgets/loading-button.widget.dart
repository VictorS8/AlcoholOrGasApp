import 'package:flutter/material.dart';

// Widget LoadingButton, create a button for click and turn on or off, depends on what the key busy will determinate
class LoadingButton extends StatelessWidget {
  var busy = false; // To control if true = circular loading ,if false = button to calculate
  var invert = false; // To control the color behind the LoadingButton
  Function func; // Required function for the onPressed function
  var text = ''; // Text which the button recevies

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy // Circular loading for true or a button to calculate
        ? Container(
            alignment: Alignment.bottomCenter,
            height: 60,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white.withOpacity(0.8),
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: invert // Change with the behind widget color
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                    color: invert // Change with the behind widget color
                        ? Colors.white.withOpacity(0.8)
                        : Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: 'Big Shoulders Display'),
              ),
              onPressed: func,
            ),
          );
  }
}
