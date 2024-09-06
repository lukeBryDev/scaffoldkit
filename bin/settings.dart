const List<String> directories = [
  /// lib/src/config/
  // 'lib/src/config/',
  'lib/src/config/env/',
  'lib/src/config/error/',
  'lib/src/config/helpers/',
  'lib/src/config/http/',
  'lib/src/config/router/',
  'lib/src/config/settings/',
  'lib/src/config/usecases/',

  /// lib/src/features/
  // 'lib/src/features/app/',
  'lib/src/features/app/presentation/',
  'lib/src/features/app/presentation/screens/',
  'lib/src/features/app/presentation/screens/example/',
  'lib/src/features/app/presentation/widgets/',
  'lib/src/features/app/presentation/widgets/example/',
  'lib/src/features/app/presentation/widgets/shared/',
  'lib/src/features/app/presentation/widgets/shared/overlays/',

  // 'lib/src/features/data/',
  'lib/src/features/data/dataSources/',
  'lib/src/features/data/mappers/',
  'lib/src/features/data/mappers/',
  'lib/src/features/data/models/',
  'lib/src/features/data/models/',
  'lib/src/features/data/models/exampleAPI/',
  'lib/src/features/data/repositories/',

  // 'lib/src/features/domain/',
  'lib/src/features/domain/dataSources/',
  'lib/src/features/domain/DTOs/',
  'lib/src/features/domain/entities/',
  'lib/src/features/domain/repositories/',
  'lib/src/features/domain/useCases/',
];

const Map<String, String> files = {
  /// lib/
  'template/main.dart': 'lib/main.dart',
  'template/injection_container.dart': 'lib/injection_container.dart',

  /// lib/src/config/
  'template/src/config/env/env.dart': 'lib/src/config/env/env.dart',
  'template/src/config/error/failures.dart':
      'lib/src/config/error/failures.dart',
  'template/src/config/helpers/human_formats.dart':
      'lib/src/config/helpers/human_formats.dart',
  'template/src/config/http/app_interceptors.dart':
      'lib/src/config/http/app_interceptors.dart',
  'template/src/config/http/example_api_provider.dart':
      'lib/src/config/http/example_api_provider.dart',
  'template/src/config/router/app_router.dart':
      'lib/src/config/router/app_router.dart',
  'template/src/config/settings/app_assets.dart':
      'lib/src/config/settings/app_assets.dart',
  'template/src/config/usecases/usecase.dart':
      'lib/src/config/usecases/usecase.dart',

  /// lib/src/features/domain/
  /// lib/src/features/domain/dataSources/
  'template/src/features/domain/dataSources/data_sources.dart':
      'lib/src/features/domain/dataSources/data_sources.dart',
  'template/src/features/domain/dataSources/example_data_source.dart':
      'lib/src/features/domain/dataSources/example_data_source.dart',

  /// lib/src/features/domain/DTOs/
  'template/src/features/domain/DTOs/dtos.dart':
      'lib/src/features/domain/DTOs/dtos.dart',
  'template/src/features/domain/DTOs/example_dto.dart':
      'lib/src/features/domain/DTOs/example_dto.dart',

  /// lib/src/features/domain/entities/
  'template/src/features/domain/entities/entities.dart':
      'lib/src/features/domain/entities/entities.dart',
  'template/src/features/domain/entities/example_entity.dart':
      'lib/src/features/domain/entities/example_entity.dart',

  /// lib/src/features/domain/repositories/
  'template/src/features/domain/repositories/example_repository.dart':
      'lib/src/features/domain/repositories/example_repository.dart',
  'template/src/features/domain/repositories/repositories.dart':
      'lib/src/features/domain/repositories/repositories.dart',

  /// lib/src/features/domain/useCases/
  'template/src/features/domain/useCases/example_use_case.dart':
      'lib/src/features/domain/useCases/example_use_case.dart',
  'template/src/features/domain/useCases/use_cases.dart':
      'lib/src/features/domain/useCases/use_cases.dart',

  /// lib/src/features/data/
  /// lib/src/features/data/dataSources/
  'template/src/features/data/dataSources/data_sources.dart':
      'lib/src/features/data/dataSources/data_sources.dart',
  'template/src/features/data/dataSources/example_remote_data_source_impl.dart':
      'lib/src/features/data/dataSources/example_remote_data_source_impl.dart',

  /// lib/src/features/data/mappers/
  'template/src/features/data/mappers/example_mapper.dart':
      'lib/src/features/data/mappers/example_mapper.dart',
  'template/src/features/data/mappers/mappers.dart':
      'lib/src/features/data/mappers/mappers.dart',

  /// lib/src/features/data/models/
  'template/src/features/data/models/models.dart':
      'lib/src/features/data/models/models.dart',

  /// lib/src/data/models/exampleAP/
  'template/src/features/data/models/exampleAPI/example_model.dart':
      'lib/src/features/data/models/exampleAPI/example_model.dart',

  /// lib/src/data/repositories/
  'template/src/features/data/repositories/example_repository_impl.dart':
      'lib/src/features/data/repositories/example_repository_impl.dart',
  'template/src/features/data/repositories/repositories.dart':
      'lib/src/features/data/repositories/repositories.dart',

  /// lib/src/features/app/
  'template/src/features/app/app.dart': 'lib/src/features/app/app.dart',

  /// lib/src/features/app/presentation/
  /// lib/src/features/app/presentation/screens/
  'template/src/features/app/presentation/screens/screens.dart':
      'lib/src/features/app/presentation/screens/screens.dart',

  /// lib/src/features/app/presentation/screens/example/
  'template/src/features/app/presentation/screens/example/example_screen.dart':
      'lib/src/features/app/presentation/screens/example/example_screen.dart',

  /// lib/src/features/app/presentation/widgets/
  'template/src/features/app/presentation/widgets/widgets.dart':
      'lib/src/features/app/presentation/widgets/widgets.dart',

  /// lib/src/features/app/presentation/widgets/example/
  'template/src/features/app/presentation/widgets/example/example_widget.dart':
      'lib/src/features/app/presentation/widgets/example/example_widget.dart',

  /// lib/src/features/app/presentation/widgets/shared/
  'template/src/features/app/presentation/widgets/shared/env_banner_wrap.dart':
      'lib/src/features/app/presentation/widgets/shared/env_banner_wrap.dart',

  /// lib/src/features/app/presentation/widgets/shared/overlays/
  'template/src/features/app/presentation/widgets/shared/overlays/custom_overlays.dart':
      'lib/src/features/app/presentation/widgets/shared/overlays/custom_overlays.dart',
};

const List<String> requiredPackages = [
  'flutter_localizations',
  'intl',
  'go_router',
  'equatable',
  'dio',
  'dartz',
  'package_info_plus',
  'get_it',
];
