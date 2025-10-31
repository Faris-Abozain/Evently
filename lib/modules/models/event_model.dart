import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  static const String collectionName = "Events";
  String image;
  String eventName;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFavourite = false;
  Event(
      {this.id = "",
      required this.image,
      required this.eventName,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.time});

       //object=>json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'image': image,
      'eventName': eventName,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavourite': isFavourite,
    };
  }
      //json=>object
  Event.fromFireStore(Map<String, dynamic> json)
      : this(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    image: json['image'] ?? '',
    eventName: json['eventName'] ?? '',
    description: json['description'] ?? '',
    dateTime: (json['dateTime'] is int)
        ? DateTime.fromMillisecondsSinceEpoch(json['dateTime'])
        : (json['dateTime'] is Timestamp)
        ? (json['dateTime'] as Timestamp).toDate()
        : DateTime.now(),
    time: json['time'] ?? '',
  );



}
