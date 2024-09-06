import 'package:get_it/get_it.dart';
import 'package:{PROJECT_NAME}/src/features/domain/repositories/repositories.dart';
import 'package:{PROJECT_NAME}/src/features/domain/dataSources/data_sources.dart';
import 'package:{PROJECT_NAME}/src/features/domain/useCases/use_cases.dart';
import 'package:{PROJECT_NAME}/src/features/data/repositories/repositories.dart';
import 'package:{PROJECT_NAME}/src/features/data/dataSources/data_sources.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // USE CASES
  sl.registerLazySingleton(() => ExampleUseCase(sl()));

  // REPOSITORIES
  sl.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(remoteDataSource: sl()));

  // DATA SOURCES
  sl.registerLazySingleton<ExampleRemoteDataSource>(
      () => ExampleRemoteDataSourceImpl());
}
