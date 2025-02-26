import 'package:get_it/get_it.dart';
import 'package:kalshi_exercise/src/domain/usecases/get_financial_wellness_usecase.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/bloc/cubit/financial_wellness_cubit.dart';

GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton<GetFinancialWellnessUsecase>(
      GetFinancialWellnessUsecase(),
      signalsReady: true);

  getIt.registerSingleton<FinancialWellnessCubit>(
      FinancialWellnessCubit(
        getIt<GetFinancialWellnessUsecase>(),
      ),
      signalsReady: true);
}
