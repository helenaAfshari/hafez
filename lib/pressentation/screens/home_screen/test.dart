import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyBottomNavigation(context: context),
          )
        ],
      ),
    );
  }
}