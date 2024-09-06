import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{PROJECT_NAME}/src/config/env/env.dart';
import 'package:{PROJECT_NAME}/src/config/router/app_router.dart';
import 'package:{PROJECT_NAME}/src/features/app/presentation/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return envBannerWrap(
      label: Env.stageLabel,
      visible: Env.showBanner,
      color: Env.showBannerColor,
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          DefaultWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'ES'),
          Locale('en', 'US'),
        ],
      ),
    );
  }
}
