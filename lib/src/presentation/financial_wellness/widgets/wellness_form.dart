import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/financial_wellness_entity.dart';

import '../../shared/i18n/strings.g.dart';
import '../../shared/shared.dart';
import '../../shared/styles/spacings.dart';


class KalshiForm extends StatefulWidget {
  const KalshiForm({super.key, required this.onContinue});

  final Function(FinancialWellnessEntity) onContinue;

  @override
  State<StatefulWidget> createState() => _KalshiFormState();
}

class _KalshiFormState extends State<KalshiForm> {
  final _formKey = GlobalKey<FormState>();
  final _incomeController = TextEditingController(text: '0.00');
  final _costsController = TextEditingController(text: '0.00');

  void _submit(FinancialWellnessEntity financialWellnessEntity) {
    if (_formKey.currentState!.validate()) {
      widget.onContinue(financialWellnessEntity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: Paddings.m,
        children: [
          KalshiTextField(
            title: t.financialWellnessTestPage.form.annualIncomeField,
            controller: _incomeController,
            hintText: "",
          ),
          KalshiTextField(
              title: t.financialWellnessTestPage.form.monthlyCostsField,
              controller: _costsController,
              hintText: ""),
          KalshiButton.primary(
            label: t.financialWellnessTestPage.form.button,
            onPressed: () {
              final income =
                  double.tryParse(_incomeController.text.replaceAll(',', '')) ??
                      0.0;
              final costs =
                  double.tryParse(_costsController.text.replaceAll(',', '')) ??
                      0.0;
              _submit(FinancialWellnessEntity(income, costs));
            },
          )
        ],
      ),
    );
  }
}
