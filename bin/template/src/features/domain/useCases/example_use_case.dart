import 'package:dartz/dartz.dart';
import 'package:{PROJECT_NAME}/src/config/error/failures.dart';
import 'package:{PROJECT_NAME}/src/config/usecases/usecase.dart';
import 'package:{PROJECT_NAME}/src/features/domain/DTOs/dtos.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';
import 'package:{PROJECT_NAME}/src/features/domain/repositories/repositories.dart';

class ExampleUseCase implements UseCase<ExampleEntity, ExampleDTO> {
  final ExampleRepository repository;

  ExampleUseCase(this.repository);

  @override
  Future<Either<Failure, ExampleEntity>> call(ExampleDTO params) async {
    return await repository.example(params);
  }
}
