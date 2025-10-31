import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../firebase_utils/firebase_utils.dart';
import '../models/event_model.dart';

class EventCard extends StatefulWidget {
  final Event event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool isFavourite;


  @override
  void initState() {
    super.initState();
    isFavourite = widget.event.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(widget.event.image),
          fit: BoxFit.cover,
        ),
      ),
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    widget.event.dateTime.day.toString(),
                    style: TextStyle(color: AppColors.prime),
                  ),
                  Text(
                    widget.event.dateTime.month.toString(),
                    style: TextStyle(color: AppColors.prime),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.event.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        await toggleFavourite(context);
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, anim) => ScaleTransition(
                          scale: anim,
                          child: child,
                        ),
                        child: Icon(
                          isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          key: ValueKey(isFavourite),
                          color: isFavourite ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> toggleFavourite(BuildContext context) async {
    setState(() {
      isFavourite = !isFavourite;
    });

    try {
      await FirebaseUtils.getEventCollection()
          .doc(widget.event.id)
          .update({'isFavourite':!isFavourite});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isFavourite
                ? "Event added to Favorites ❤️"
                : "Event removed from Favorites 💔",
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    } catch (e) {
      setState(() {
        isFavourite = !isFavourite;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error updating event. Try again."),
        ),
      );
    }
  }
}
