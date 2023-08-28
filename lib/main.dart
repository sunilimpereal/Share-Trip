import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_trip/constants/theme_constants.dart';
import 'package:share_trip/modules/auth/screen/login_screen.dart';
import 'package:share_trip/modules/create_trip/bloc/createtrip_bloc.dart';
import 'package:share_trip/modules/home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateTripBloc()),
      ],
      child: MaterialApp(
          title: 'Trip Share',
          theme: ThemeConstants.minaTheme,
          home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomeScreen()),
    );
  }
}
