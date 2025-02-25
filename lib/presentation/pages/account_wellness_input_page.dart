import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_appbar.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_button.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_form.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_textfield.dart';

class AccountWellnessInputPage extends StatefulWidget {
  const AccountWellnessInputPage({Key? key}) : super(key: key);

  @override
  _AccountWellnessInputPageState createState() =>
      _AccountWellnessInputPageState();
}

class _AccountWellnessInputPageState extends State<AccountWellnessInputPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: KalshiAppbar(),
        body: _AccountWellnessInputBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class _AccountWellnessInputBody extends StatelessWidget {
  const _AccountWellnessInputBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              Text(
                'Let\'s find out your financial wellness score.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Card(
                color: Colors.white,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(35),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        spacing: 16,
                        children: [
                          SvgPicture.asset("assets/images/logo-image.svg"),
                          Column(
                            children: [
                              const Text('Financial wellness test'),
                              const Text(
                                  'Enter your financial information bellow'),
                            ],
                          ),
                          KalshiForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                spacing: 16,
                children: [
                  Image.asset(
                    "assets/images/kalshi-lock.png",
                  ),
                  Text(
                    "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
