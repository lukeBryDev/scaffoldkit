import 'package:dartz/dartz.dart';
import 'package:{PROJECT_NAME}/src/config/error/failures.dart';
import 'package:{PROJECT_NAME}/src/features/domain/DTOs/dtos.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';

abstract class ExampleRepository {
  Future<Either<Failure, ExampleEntity>> example(ExampleDTO params);
}
