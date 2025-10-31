import 'package:events/modules/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../models/event_model.dart';

class FavScreen extends StatelessWidget {
  final List<Event> favoriteEvents;

  const FavScreen({super.key, required this.favoriteEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              onTapOutside: (PointerDownEvent event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                prefixIcon: const Icon(CupertinoIcons.search),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: favoriteEvents.isEmpty
                  ? const Center(
                child: Text(
                  "No favorite events yet",
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.separated(
                itemCount: favoriteEvents.length,
                itemBuilder: (context, index) {
                  return EventCard(event: favoriteEvents[index]);
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
