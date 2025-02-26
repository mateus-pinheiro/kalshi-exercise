import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/usecases/get_account_wellness_usecase.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/bloc/state/account_wellness_state.dart';

class AccountWellnessCubit extends Cubit {
  AccountWellnessCubit({
    required this.getAccountWellnessUsecase,
  }
  ) : super(null);

  final GetAccountWellnessUsecase getAccountWellnessUsecase;

  void accountWellness(AccountWellnessEntity accountWellnessEntity) async {
    final either = getAccountWellnessUsecase(accountWellnessEntity);
    either.fold(
      (failure) => emit(AccountWellnessFailState(failure)),
      (status) => emit(AccountWellnessState(status)),
    );
  }
}
