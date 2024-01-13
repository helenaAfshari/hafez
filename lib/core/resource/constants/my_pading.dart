
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:flutter/material.dart';

class MyPaddings {
  static const loginPadding = EdgeInsets.symmetric(
    horizontal: 65,
    vertical: 40,
  );
  static const all2 = EdgeInsets.all(2);
  static const all4 = EdgeInsets.all(4);
  static var all8 = EdgeInsets.all(MyDimensions.light);
  static var all12 = EdgeInsets.all(MyDimensions.xLight);
  static var all24 = EdgeInsets.all(MyDimensions.semiLarge);
  static var homeAppbar = EdgeInsets.fromLTRB(
    MyDimensions.medium,
    MyDimensions.semiLarge,
    MyDimensions.medium,
    MyDimensions.medium,
  );

  static var searchWidget = EdgeInsets.symmetric(
    horizontal: MyDimensions.medium,
    vertical: MyDimensions.light,
  );

  static var horizontal20 =
      EdgeInsets.symmetric(horizontal: MyDimensions.medium + MyDimensions.small);

  static var mainPageLists = EdgeInsets.only(bottom: MyDimensions.xlarge * 2.5);
}