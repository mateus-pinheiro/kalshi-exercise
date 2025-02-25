import 'package:get_it/get_it.dart';
import 'package:kalshi_exercise/domain/usecases/get_account_wellness_usecase.dart';
import 'package:kalshi_exercise/presentation/bloc/cubit/account_wellness_cubit.dart';

GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton<GetAccountWellnessUsecase>(
      GetAccountWellnessUsecase(),
      signalsReady: true);

  getIt.registerSingleton<AccountWellnessCubit>(
      AccountWellnessCubit(
        getAccountWellnessUsecase: getIt<GetAccountWellnessUsecase>(),
      ),
      signalsReady: true);
}
