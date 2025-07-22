import 'package:events/modules/layouts/layout_screen.dart';
import 'package:events/modules/screens/login_screen.dart';
import 'package:events/modules/screens/register_screen.dart';
import 'package:events/modules/screens/reset_password_screen.dart';
import 'package:events/modules/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/welcome_screen.dart';
import 'app_routes_name.dart';
class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash:(_)=>const SplashScreen(),
    AppRoutesName.welcome:(_)=>const WelcomeScreen(),
    AppRoutesName.login:(_)=>const LoginScreen(),
    AppRoutesName.register:(_)=>const RegisterScreen(),
    AppRoutesName.resetPassword:(_)=>const ResetPasswordScreen(),
    AppRoutesName.layout:(_)=>const LayoutScreen(),

  } ;
}

