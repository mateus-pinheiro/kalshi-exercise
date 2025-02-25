import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalshiTextField extends StatelessWidget {
  const KalshiTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 7,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Only numbers
          decoration: InputDecoration(
            hintText: 'Enter your income',
            prefixIcon: Image.asset("assets/images/money-symbol.png"),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
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
            final number = double.tryParse(value);
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
