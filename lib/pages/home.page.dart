import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// Widget HomePage, is the main screen with all the widgets 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple; // Just to change and make the animation with the AnimatedContainer
  var _gasCrtl = MoneyMaskedTextController(); // Gas Controller
  var _alcCrtl = MoneyMaskedTextController(); // Alcohol Controller
  var _busy = false; // Checking if the button is busy
  var _completed = false; // Checking if the calculate action fineshed
  var _resultText = 'Compensa utilizar álcool'; // Text that shows which is better

  Future calculate() {
    // Is a way to take off the ',.' and let number together and after this doing a division
    // Like alc = '3,40' => '340' => 340 / 100 => 3.40 || A way to use the real numbers for calculate
    double alc = double.parse(
          _alcCrtl.text.replaceAll(RegExp(r'[,.]'), ''),
        ) /
        100;
    double gas = double.parse(
          _gasCrtl.text.replaceAll(RegExp(r'[,.]'), ''),
        ) /
        100;
    double res = alc / gas;

    setState(() {
      _color = Colors.black; // The color will change
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = 'Compensa utilizar Gasolina!';
        } else {
          _resultText = 'Compensa utilizar Álcool';
        }
        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _alcCrtl = MoneyMaskedTextController();
      _gasCrtl = MoneyMaskedTextController();
      _color = Colors.deepPurple; // The color will change back
      _completed = false;
      _busy = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color, // Because of the control inside the AnimatedContainer
        child: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Sucess(
                  reset: reset,
                  result: _resultText,
                )
              : SubmitForm(
                  alcCrtl: _alcCrtl,
                  gasCrtl: _gasCrtl,
                  submitFunc: calculate,
                  busy: _busy,
                ),
        ],
      ),
      ),
    );
  }
}
