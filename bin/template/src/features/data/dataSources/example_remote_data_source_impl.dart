import 'package:dio/dio.dart';
import 'package:{PROJECT_NAME}/src/config/error/failures.dart';
import 'package:{PROJECT_NAME}/src/config/http/example_api_provider.dart';
import 'package:{PROJECT_NAME}/src/features/domain/DTOs/dtos.dart';
import 'package:{PROJECT_NAME}/src/features/data/mappers/mappers.dart';
import 'package:{PROJECT_NAME}/src/features/data/models/models.dart';
import 'package:{PROJECT_NAME}/src/features/domain/dataSources/data_sources.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';

class ExampleRemoteDataSourceImpl extends ExampleAPIProvider
    implements ExampleRemoteDataSource {
  @override
  Future<ExampleEntity> example(ExampleDTO params) async {
    try {
      const String path = '/api/example';
      final res = await dio.get(path, queryParameters: params.toQueryParams());
      final issues = ExampleModel.fromJson(res.data);
      return ExampleMapper.exampleEntity(issues);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (error) {
      throw ErrorFailure(error: error).extract;
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
