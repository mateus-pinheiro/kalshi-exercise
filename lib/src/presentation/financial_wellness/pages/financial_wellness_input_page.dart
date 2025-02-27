import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_router.dart';
import '../../../core/di.dart';
import '../../../domain/entities/financial_wellness_entity.dart';
import '../../shared/i18n/strings.g.dart';
import '../../shared/shared.dart';
import '../../shared/styles/font_styles.dart';
import '../../shared/styles/spacings.dart';
import '../bloc/cubit/financial_wellness_cubit.dart';
import '../bloc/state/financial_wellness_state.dart';
import '../widgets/security_info.dart';
import 'financial_wellness_result_page.dart';

class AccountWellnessInputPage extends StatefulWidget {
  const AccountWellnessInputPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountWellnessInputPageState();
}

class _AccountWellnessInputPageState extends State<AccountWellnessInputPage> {
  final _cubit = getIt<FinancialWellnessCubit>();

  void onSubmittedCallback(FinancialWellnessEntity financialWellnessEntity) {
    _cubit.financialWellness(financialWellnessEntity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FinancialWellnessCubit, FinancialWellnessState>(
      listener: (context, state) {
        if (state is FinancialWellnessSuccessfullyState) {
          context.pushNamed(
            AppRoutes.result,
            extra: AccountWellnessResultPageArguments(
              status: state.financialWellnessStatus,
            ),
          );
        }
      },
      bloc: _cubit,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: KalshiAppbar(),
          body: _AccountWellnessInputBody(onSubmittedCallback),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _AccountWellnessInputBody extends StatelessWidget {
  const _AccountWellnessInputBody(this.onContinueButtonPressed);

  final Function(FinancialWellnessEntity) onContinueButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.m),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: Paddings.xl,
              children: [
                Text.rich(
                  t.financialWellnessTestPage.title(
                    bold: (text) => TextSpan(
                      text: text,
                      style: FontStyles.titleBold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: FontStyles.title,
                ),
                _InputCard(onContinueButtonPressed),
                const SecurityInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  const _InputCard(this.onContinueButtonPressed);

  final Function(FinancialWellnessEntity) onContinueButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BorderSizes.l),
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
          padding: const EdgeInsets.all(
            Paddings.m,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              spacing: Paddings.m,
              children: [
                SvgPicture.asset("assets/images/logo-image.svg"),
                Column(
                  children: [
                    Text(
                      t.financialWellnessTestPage.form.title,
                      style: FontStyles.cardTitle,
                    ),
                    Text(
                      t.financialWellnessTestPage.form.description,
                      style: FontStyles.subtitle,
                    ),
                  ],
                ),
                KalshiForm(
                  onContinue: onContinueButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
