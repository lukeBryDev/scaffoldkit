import 'package:flutter/material.dart';
import 'package:{PROJECT_NAME}/src/config/env/env.dart';
import 'package:{PROJECT_NAME}/src/features/app/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await dotenv.load(fileName: '.env');
  Env(EnvMode.sandbox);
  runApp(const App());
}
