const List<String> files = [
  /// lib/
  'main.dart',
  'injection_container.dart',

  /// lib/src/config/
  'src/config/env/env.dart',

  'src/config/error/failures.dart',

  'src/config/helpers/human_formats.dart',

  'src/config/http/app_interceptors.dart',

  'src/config/http/example_api_provider.dart',

  'src/config/router/app_router.dart',

  'src/config/settings/app_assets.dart',

  'src/config/usecases/usecase.dart',

  /// lib/src/features/domain/
  /// lib/src/features/domain/dataSources/

  'src/features/domain/dataSources/data_sources.dart',

  'src/features/domain/dataSources/example_data_source.dart',

  /// lib/src/features/domain/DTOs/

  'src/features/domain/DTOs/dtos.dart',

  'src/features/domain/DTOs/example_dto.dart',

  /// lib/src/features/domain/entities/

  'src/features/domain/entities/entities.dart',

  'src/features/domain/entities/example_entity.dart',

  /// lib/src/features/domain/repositories/

  'src/features/domain/repositories/example_repository.dart',

  'src/features/domain/repositories/repositories.dart',

  /// lib/src/features/domain/useCases/

  'src/features/domain/useCases/example_use_case.dart',

  'src/features/domain/useCases/use_cases.dart',

  /// lib/src/features/data/
  /// lib/src/features/data/dataSources/

  'src/features/data/dataSources/data_sources.dart',

  'src/features/data/dataSources/example_remote_data_source_impl.dart',

  /// lib/src/features/data/mappers/

  'src/features/data/mappers/example_mapper.dart',

  'src/features/data/mappers/mappers.dart',

  /// lib/src/features/data/models/

  'src/features/data/models/models.dart',

  /// lib/src/data/models/exampleAP/

  'src/features/data/models/exampleAPI/example_model.dart',

  /// lib/src/data/repositories/

  'src/features/data/repositories/example_repository_impl.dart',

  'src/features/data/repositories/repositories.dart',

  /// lib/src/features/app/
  'src/features/app/app.dart',

  /// lib/src/features/app/presentation/
  /// lib/src/features/app/presentation/screens/

  'src/features/app/presentation/screens/screens.dart',

  /// lib/src/features/app/presentation/screens/example/

  'src/features/app/presentation/screens/example/example_screen.dart',

  /// lib/src/features/app/presentation/widgets/

  'src/features/app/presentation/widgets/widgets.dart',

  /// lib/src/features/app/presentation/widgets/example/

  'src/features/app/presentation/widgets/example/example_widget.dart',

  /// lib/src/features/app/presentation/widgets/shared/

  'src/features/app/presentation/widgets/shared/env_banner_wrap.dart',

  /// lib/src/features/app/presentation/widgets/shared/overlays/

  'src/features/app/presentation/widgets/shared/overlays/custom_overlays.dart',
];

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
