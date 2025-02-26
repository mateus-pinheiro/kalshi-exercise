import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_button.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_textfield.dart';

class KalshiForm extends StatefulWidget {
  const KalshiForm({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  State<StatefulWidget> createState() => _KalshiFormState();
}

class _KalshiFormState extends State<KalshiForm> {
  final _formKey = GlobalKey<FormState>();
  final _incomeController = TextEditingController();
  final _costsController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onContinue();
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
            title: 'Annual Income',
            controller: _incomeController,
            hintText: "52,000",
          ),
          KalshiTextField(
              title: 'Monthly Costs',
              controller: _costsController,
              hintText: "3,150"),
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
