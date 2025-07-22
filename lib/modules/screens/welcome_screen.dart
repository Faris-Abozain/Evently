import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:events/core/app_colors.dart';
import 'package:events/modules/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                      duration: Duration(seconds: 1),
                      child: Image.asset(
                        "assets/logo/event_logo.png",
                        height: 55,
                        width: 55,
                      )),
                  FadeInRight(
                      duration: Duration(seconds: 1),
                      child: Text(
                        "Evently",
                        style: GoogleFonts.jockeyOne(
                            color: AppColors.prime, fontSize: 36),
                      )),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/welcome_image.png"),
                  ),
                  Text("Personalize Your Experience"),
                  Text(
                      "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style."),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Languge",
                        style: TextStyle(
                            color: AppColors.prime,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      AnimatedToggleSwitch<int>.rolling(
                        style: ToggleStyle(
                          borderRadius: BorderRadius.circular(20),
                          borderColor: AppColors.prime,
                          backgroundColor: Colors.transparent,
                          indicatorColor: AppColors.prime,
                        ),
                        current: 0,
                        values: [0, 1],
                        iconList: [
                          Image.asset("assets/icons/america.png"),
                          Image.asset("assets/icons/egypt.png"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Theme",
                        style: TextStyle(
                            color: AppColors.prime,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      AnimatedToggleSwitch<int>.rolling(
                        style: ToggleStyle(
                          borderRadius: BorderRadius.circular(20),
                          borderColor: AppColors.prime,
                          backgroundColor: Colors.transparent,
                          indicatorColor: AppColors.prime,
                        ),
                        current: 0,
                        values: [0, 1],
                        iconList: [
                          Image.asset("assets/icons/light.png"),
                          Image.asset("assets/icons/dark.png"),
                        ],
                      ),
                      // many more parameters available
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.login);
                      },
                      child: Container(
                        height: 55,
                        width: 360,
                        decoration: BoxDecoration(
                          color: AppColors.prime,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(
                            child: Text(
                              "Let’s Start",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
