import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_exercise/src/core/app_router.dart';
import 'package:kalshi_exercise/src/core/di.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/bloc/cubit/account_wellness_cubit.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/pages/account_wellness_result_page.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/widgets/security_info.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_appbar.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_wellness_form.dart';

class AccountWellnessInputPage extends StatefulWidget {
  const AccountWellnessInputPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountWellnessInputPageState();
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
  const _AccountWellnessInputBody();

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
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'WorkSans',
                ),
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
                        blurStyle: BlurStyle.outer,
                        color: Colors.grey.withAlpha(80),
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
                              Text(
                                'Financial wellness test',
                                style: FontStyles.title,
                              ),
                              Text(
                                'Enter your financial information bellow',
                                style: FontStyles.subtitle,
                              ),
                            ],
                          ),
                          KalshiForm(
                            onContinue: () => context.pushNamed(
                              AppRoutes.result,
                              extra: AccountWellnessResultPageArguments(
                                status: AccountWellnessStatus.healthy,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SecurityInfo(),
            ],
          ),
        ),
      ),
    );
  }

  // void onContinue(BuildContext context, double annualGrossIncome,
  //     double averageMonthlyCosts) {
  //   final cubit = getIt<AccountWellnessCubit>();
  //   final status = cubit.accountWellness(
  //       AccountWellnessEntity(annualGrossIncome, averageMonthlyCosts));
  //   context.pushNamed(
  //     AppRoutes.result,
  //     extra: AccountWellnessResultPageArguments(
  //       status: status,
  //     ),
    // );
  // }
}
