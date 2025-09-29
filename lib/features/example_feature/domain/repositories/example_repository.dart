import 'package:dartz/dartz.dart';
import '../entites/example_entity.dart';
import '../../../../core/error/failures.dart';


/// Contract for the repository that the data layer must implement
abstract class ExampleRepository {
  Future<Either<Failure, ExampleEntity>> getExample();
}
