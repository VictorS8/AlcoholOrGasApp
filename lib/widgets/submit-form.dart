import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// Widget SubmitForm, for complet with the inputs to submit the numbers to calculate
class SubmitForm extends StatelessWidget {
  var gasCrtl = MoneyMaskedTextController(); // Controller to the gas number
  var alcCrtl = MoneyMaskedTextController(); // Controller to the alcohol number
  var busy = false; // to see if is busy when onPressed the LoadingButton
  Function submitFunc; // A function to submit the numbers

  SubmitForm({
    @required this.gasCrtl,
    @required this.alcCrtl,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          child: Input(
            label: 'Gasolina',
            crtl: gasCrtl,
          ),
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
        ),
        Padding(
          child: Input(
            label: 'Álcool',
            crtl: alcCrtl,
          ),
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
        ),
        LoadingButton(
          busy: busy,
          func: submitFunc,
          text: 'Calcular',
          invert: false,
        ),
      ],
    );
  }
}
