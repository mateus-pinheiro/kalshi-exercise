import 'package:either_dart/either.dart';
import 'package:kalshi_exercise/src/core/failure.dart';

abstract class Usecase<T, Params> {
  Either<Failure, T> call(Params params);
}