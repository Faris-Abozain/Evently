import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/modules/models/event_model.dart';

class FirebaseUtils {
 static CollectionReference<Event> getEventCollection(){
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
      fromFirestore: (snapshot, options) =>
          Event.fromFireStore(snapshot.data()!),
      toFirestore: (event, options) => event.toFireStore(),
    );
  }


  static Future<void> addEventToFireStore(Event event) {
   var eventsCollection= getEventCollection();
   DocumentReference<Event> docRef=eventsCollection.doc();
   event.id=docRef.id;
   return docRef.set(event);
  }
}
