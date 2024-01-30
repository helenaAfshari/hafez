import 'package:flutter/material.dart';
import 'package:hafez/pressentation/mainscreen/main_screen.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_favorite.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:hafez/route/names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.homeScreen: (context) => HomeScreen(),
  ScreenNames.favoriteScreen: (context) => GhazaliatFavoriteScreen(),
 // ScreenNames.detailsGhazaliatHafezScreen: (context) => DetailsGhazaliatHafezScreen(),
  ScreenNames.ghazaliatHafezScreen: (context) => GhazaliatHafezScreen(),
 // ScreenNames.mainScreen: (context) => MainScreen(),
};