import 'package:autharization_hanna/pressentation/screens/authscreen/check_otp_screen.dart';
import 'package:autharization_hanna/pressentation/screens/authscreen/login_screen.dart';
import 'package:autharization_hanna/pressentation/screens/home_screen/home_screen.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter/material.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomeScreen(),
    );
  }
}
