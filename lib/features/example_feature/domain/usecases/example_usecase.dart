import 'package:dartz/dartz.dart';
import '../repositories/example_repository.dart';
import '../entites/example_entity.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/error/failures.dart';

/// Example use case to fetch data from the repository.
class GetExample implements UseCase<Either<Failure, ExampleEntity>, NoParams> {
  final ExampleRepository repository;

  GetExample(this.repository);

  @override
  Future<Either<Failure, ExampleEntity>> call(NoParams params) {
    return repository.getExample();
  }
}
