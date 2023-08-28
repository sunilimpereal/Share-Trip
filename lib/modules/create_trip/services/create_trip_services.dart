import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_trip/modules/create_trip/models/create_trip_model.dart';

class CreateTripServices {
  CollectionReference trips = FirebaseFirestore.instance.collection('trips');

  Future<String?> createTrip({required CreateTripModel createTripModel}) async {
    var val = await trips.add(createTripModel.toJson());
    return val.id;
  }
}
