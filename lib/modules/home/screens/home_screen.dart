import 'package:flutter/material.dart';
import 'package:share_trip/common_componenets/drawer.dart';
import 'package:share_trip/modules/create_trip/screens/create_trip_screen.dart';
import 'package:share_trip/modules/home/widgets/home_type_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Trip"),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeTypeCard(
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateTripScreen()));
                  },
                  title: "Crate Trip"),
              HomeTypeCard(
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  title: "Join Trip"),
            ],
          ),
        ],
      ),
    );
  }
}
