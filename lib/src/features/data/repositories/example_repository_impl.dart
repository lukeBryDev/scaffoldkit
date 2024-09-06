import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:{PROJECT_NAME}/src/config/error/failures.dart';
import 'package:{PROJECT_NAME}/src/features/domain/repositories/repositories.dart';
import 'package:{PROJECT_NAME}/src/features/domain/dataSources/data_sources.dart';
import 'package:{PROJECT_NAME}/src/features/domain/entities/entities.dart';
import 'package:{PROJECT_NAME}/src/features/domain/DTOs/dtos.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSource remoteDataSource;

  ExampleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ExampleEntity>> example(ExampleDTO params) async {
    try {
      final res = await remoteDataSource.example(params);
      return Right(res);
    } on ServerFailure catch (server) {
      return Left(server);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (e) {
      throw ErrorFailure(error: e);
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
