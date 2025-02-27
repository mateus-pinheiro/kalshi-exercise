import 'package:flutter/material.dart';

import '../../shared/i18n/strings.g.dart';
import '../../shared/styles/font_styles.dart';
import '../../shared/styles/spacings.dart';

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
          padding: EdgeInsets.symmetric(horizontal: Paddings.xxxl),
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
