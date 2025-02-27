import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/financial_wellness_entity.dart';
import '../../../../domain/usecases/get_financial_wellness_usecase.dart';
import '../state/financial_wellness_state.dart';

class FinancialWellnessCubit extends Cubit<FinancialWellnessState> {
  FinancialWellnessCubit(
    this._getFinancialWellnessUsecase,
  ) : super(FinancialWellnessState());

  final GetFinancialWellnessUsecase _getFinancialWellnessUsecase;

  void financialWellness(
      FinancialWellnessEntity financialWellnessEntity) async {
    final either = _getFinancialWellnessUsecase(financialWellnessEntity);
    either.fold(
      (failure) => emit(FinancialWellnessFailState(failure)),
      (status) => emit(FinancialWellnessSuccessfullyState(status)),
    );
  }
}
