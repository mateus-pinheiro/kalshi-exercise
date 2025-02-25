import 'package:flutter/material.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_button.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_textfield.dart';

class KalshiForm extends StatefulWidget {
  @override
  _KalshiFormState createState() => _KalshiFormState();
}

class _KalshiFormState extends State<KalshiForm> {
  final _formKey = GlobalKey<FormState>();
  final _incomeController = TextEditingController();
  final _costsController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process data
      print('Annual Income: ${_incomeController.text}');
      print('Monthly Costs: ${_costsController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          KalshiTextField(
              title: 'Annual Income', controller: _incomeController),
          KalshiTextField(title: 'Monthly Costs', controller: _costsController),
          KalshiButton.primary(
            label: "Continue",
            onPressed: () {
              _submit();
            },
          )
        ],
      ),
    );
  }
}
