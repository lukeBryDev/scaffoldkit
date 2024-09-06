import 'package:{PROJECT_NAME}/src/features/data/models/models.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';

class ExampleMapper {
  static ExampleEntity exampleEntity(ExampleModel example) => ExampleEntity(
        id: example.id,
        name: example.name,
      );
}
