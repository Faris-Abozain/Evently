import 'package:events/core/app_colors.dart';
import 'package:events/modules/layouts/fav_screen.dart';
import 'package:events/modules/layouts/home_screen.dart';
import 'package:events/modules/layouts/map_screen.dart';
import 'package:events/modules/layouts/profile_screen.dart';
import 'package:events/modules/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    FavScreen(favoriteEvents: [],),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context,AppRoutesName.creatEvent);
        },
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360),
        side: BorderSide(color: Colors.white,width: 3)
        ),
        backgroundColor: AppColors.prime,
        child: Icon(Icons.add,size: 40,),
        foregroundColor: Colors.white,

      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.prime,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          fixedColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: "Map",
                activeIcon: Icon(Icons.location_on)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Love",
                activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "Profile",
                activeIcon: Icon(Icons.person))
          ]),
    );
  }
}
