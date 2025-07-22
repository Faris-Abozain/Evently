import 'package:events/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.prime,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(1000),
                          bottomRight: Radius.circular(1000),
                          bottomLeft: Radius.circular(1000),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.asset(
                            "assets/images/route_image.png",
                            height: 130,
                            width: 130,
                          ),
                        )),
                    Column(
                      children: [
                        Text(
                          "Faris AboZain",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text("farisabozein@gmail.com",
                            style: TextStyle(fontSize: 16, color: Colors.white))
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
          Column(
            children: [
              Text("Language",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  isExpanded: true,
                  value: "ar",
                  items: [
                    DropdownMenuItem(
                      child: Text("Arabic"),
                      value: "ar",
                    ),
                    DropdownMenuItem(
                      child: Text("English"),
                      value: "en",
                    )
                  ],
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 20,),
              Text("Theme",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  isExpanded: true,
                  value: "light",
                  items: [
                    DropdownMenuItem(
                      child: Text("light"),
                      value: "light",
                    ),
                    DropdownMenuItem(
                      child: Text("dark"),
                      value: "dark",
                    )
                  ],
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 220,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout,color: Colors.white,),
                      Text("Log Out",style: TextStyle(fontSize: 16,color: Colors.white),)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
