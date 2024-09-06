import 'package:{PROJECT_NAME}/src/features/app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: ExampleScreen.name,
    builder: (context, state) => const ExampleScreen(),
  ),
], initialLocation: '/');
