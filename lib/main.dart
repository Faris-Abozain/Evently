import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/modules/routes/app_routes.dart';
import 'package:events/modules/routes/app_routes_name.dart';
import 'package:events/modules/screens/splash_screen.dart';
import 'package:events/modules/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: AppRoutes.routes,
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
     // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}


