import 'package:flutter/material.dart';
import 'package:share_trip/constants/theme_constants.dart';
import 'package:share_trip/modules/auth/screen/login_screen.dart';
import 'package:share_trip/modules/create_trip/screens/create_trip_screen.dart';

import 'modules/view_trip/screens/view-trip_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Share',
      theme: ThemeConstants.minaTheme,
      home: const ViewTripScren()
    );
  } 
}
 