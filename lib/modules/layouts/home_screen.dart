import 'package:events/core/app_colors.dart';
import 'package:events/modules/widgets/customTab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.prime,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Welcome Back ✨",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                            Text("Faris Abozain",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,color: Colors.white)),
                          ],
                        ),
                      ),Spacer(),
                      Image.asset("assets/icons/light.png"),
                      Image.asset("assets/icons/En.png"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.white,),
                        Text("Cairo,Egypt",style: TextStyle(color: Colors.white,fontSize: 16),)
                      ],
                    ),
                  ),
                  DefaultTabController(
                      length: 5, child: TabBar(tabs: [
                    Tab(child: Customtab(categoryName: "All"),),
                    Tab(child: Customtab(categoryName: "Sport"),),
                    Tab(child: Customtab(categoryName: "birthday"),),
                    Tab(child: Customtab(categoryName: "holiday"),),
                    Tab(child: Customtab(categoryName: "Meeting"),),
                  ]))
                ],
              ),
            ),
          ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/birthday_image.png",
                          ),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Text(
                                "21",
                                style: TextStyle(color: AppColors.prime),
                              ),
                              Text("Nov",
                                  style: TextStyle(color: AppColors.prime))
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "This is a Birthday Party ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Icon(Icons.favorite_border_outlined)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: 4,
            ))
          ],
        ),
      ),
    );
  }
}
