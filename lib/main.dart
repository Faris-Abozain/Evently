import 'package:events/modules/routes/app_routes.dart';
import 'package:events/modules/routes/app_routes_name.dart';
import 'package:events/modules/screens/splash_screen.dart';
import 'package:events/modules/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: AppRoutes.routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}


