import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';

class KalshiTextField extends StatefulWidget {
  const KalshiTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _KalshiTextFieldState();
}

class _KalshiTextFieldState extends State<KalshiTextField> {
  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '',
  );

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_formatInput);
    super.dispose();
  }

  void _formatInput() {
    String text = widget.controller.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.isEmpty) {
      widget.controller.text = '';
      return;
    }

    double value = double.parse(text) / 100; // Convert cents to dollars
    String formattedValue = _currencyFormat.format(value);

    // Prevents cursor from jumping to the end
    widget.controller.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 7,
      children: [
        Text(
          widget.title,
          style: FontStyles.caption,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: FontStyles.inputHint,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: FontStyles.inputHint,
            labelStyle: FontStyles.inputLabel,
            prefixIcon: Image.asset("assets/images/money-symbol.png"),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            final number =
                double.tryParse(value.replaceAll(RegExp(r'[^0-9.]'), ''));
            if (number == null || number <= 0) {
              return 'Value must be greater than zero';
            }
            return null;
          },
        ),
      ],
    );
  }
}
