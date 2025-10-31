import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/app_colors.dart';
import 'package:events/modules/firebase_utils/firebase_utils.dart';
import 'package:events/modules/widgets/customTab.dart';
import 'package:events/modules/widgets/event_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> tabsName = [
    "All",
    "sport",
    "birthday",
    "meeting",
    "gaming",
    "work shop",
    "book club",
    "exhibition",
    "holiday",
    "eating",
  ];

  int selectedIndex = 0;
  List<Event> eventsList = [];
  List<Event> filteredList = [];

  @override
  Widget build(BuildContext context) {
    if (eventsList.isEmpty) {
      getAllEvents();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.prime,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome Back ✨",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                user?.displayName ?? "",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset("assets/icons/light.png"),
                        Image.asset("assets/icons/En.png"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Cairo, Egypt",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              changeSelectedIndex(index);
                            },
                            child: Customtab(
                              categoryName: tabsName[index],
                              isSelected: selectedIndex == index,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                        itemCount: tabsName.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                      "No Events Here",
                      style: TextStyle(fontSize: 24, color: AppColors.prime),
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EventCard(
                            event: filteredList[index],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 20),
                      itemCount: filteredList.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void getAllEvents() {
    FirebaseUtils.getEventCollection().snapshots().listen((snapshot) {
      eventsList = snapshot.docs.map((doc) => doc.data()).toList();
      getFilteredEvents();
    });
  }

  void getFilteredEvents() {
    if (selectedIndex == 0) {
      filteredList = eventsList;
    } else {
      filteredList = eventsList
          .where((event) =>
              event.eventName.toLowerCase() ==
              tabsName[selectedIndex].toLowerCase())
          .toList();
    }
    setState(() {});
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    getFilteredEvents();
  }

  // void updateIsFavoriteEvents(Event event) async {
  //   FirebaseUtils.getEventCollection()
  //       .doc(event.id)
  //       .update({'isFavourite': !event.isFavourite}).timeout(Duration(milliseconds: 500),onTimeout: () {
  //         return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Event Was Added to Favorit Successfully")));
  //       },);
  // }
}
