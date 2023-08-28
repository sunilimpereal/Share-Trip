import 'package:flutter/material.dart';
import 'package:share_trip/constants/color_constants.dart';

import '../widgets/member_details.dart';
import '../widgets/trip_details.dart';

class ViewTripScren extends StatefulWidget {
  const ViewTripScren({super.key});

  @override
  State<ViewTripScren> createState() => _ViewTripScrenState();
}

class _ViewTripScrenState extends State<ViewTripScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Details"),
      ),
      body: Column(
        children: const [
          TripDetails(),
          MemberDetails()
        ],
      ),
    );
  }
}
