import 'package:{PROJECT_NAME}/src/features/domain/DTOs/dtos.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';

abstract class ExampleRemoteDataSource {
  Future<ExampleEntity> example(ExampleDTO params);
}
