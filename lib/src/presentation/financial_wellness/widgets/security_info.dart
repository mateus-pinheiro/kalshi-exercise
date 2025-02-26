import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/presentation/shared/i18n/strings.g.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';

class SecurityInfo extends StatelessWidget {
  const SecurityInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Image.asset(
          "assets/images/kalshi-lock.png",
          color: Color.fromRGBO(138, 156, 169, 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            t.securityInfo,
            style: FontStyles.body,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
