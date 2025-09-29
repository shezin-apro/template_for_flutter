// core/network/api_handler.dart
import '../error/exceptions.dart';
import '../error/failures.dart';
import 'package:dartz/dartz.dart';

typedef AsyncCallback<T> = Future<T> Function();

class ApiHandler {
  /// Executes an API call and converts exceptions to Failures
  Future<Either<Failure, T>> execute<T>(AsyncCallback<T> call) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
