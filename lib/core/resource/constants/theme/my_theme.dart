
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyTHeme {
  static ThemeData lightTheme() => ThemeData(
        textTheme: const TextTheme(
          ///Title
          titleLarge: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w400,
            color: MyColors.textColor,
            fontSize: 20,
          )));

             
}