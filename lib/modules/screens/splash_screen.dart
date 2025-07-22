import 'package:animate_do/animate_do.dart';
import 'package:events/core/app_colors.dart';
import 'package:events/modules/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName="splash_screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Center(child: FadeInRight(
            duration: Duration(seconds: 1),
            child: Image.asset("assets/logo/event_logo.png"))),
        FadeInLeft(
            duration: Duration(seconds: 1),
            child: Text("Evently",style: GoogleFonts.jockeyOne(color: AppColors.prime,fontSize: 36),)),
        Spacer(),
        BounceInUp(
            delay: Duration(seconds: 2),
            onFinish: (direction) {
              Navigator.pushNamed(context, AppRoutesName.welcome);
            },
            child: Image.asset("assets/logo/route_logo.png"))
      ],
    ),
    );
  }
}
