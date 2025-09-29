import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entites/example_entity.dart';
import '../data_sources/example_remote_datasource.dart';
import '../../domain/repositories/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final ApiHandler apiHandler;

  ExampleRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.apiHandler,
  });

  @override
  Future<Either<Failure, ExampleEntity>> getExample() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    // Wrap your API call in the handler
    return apiHandler.execute(() async {
      final model = await remoteDataSource.getExampleData();
      return model;
    });
  }
}
