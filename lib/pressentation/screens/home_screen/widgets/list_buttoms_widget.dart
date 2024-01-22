

import 'package:hafez/core/components/customwidgets/custom_button.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_fav.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:flutter/material.dart';
import 'package:hafez/route/names.dart';

Widget listBottomsWidget(int index,BuildContext context){
  return 
  CustomButtonWidget(
     margin: const EdgeInsets.only(left: 67.0,right: 67.0),
     height: UIUtils.getConvertedHeight(context,53),
     width: UIUtils.getConvertedWidth(context,226),
     borderRadius: const BorderRadius.all(Radius.circular(8.0)),
     color: MyColors.boxBottomColor,
     border: Border.all(color: MyColors.borderBottomColor),
      text: MyStrings.ghazaliatHafezText,
    textStyle:MyTHeme.lightTheme().textTheme.titleLarge,
    onPress: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const GhazaliatFav()),
  );
  },);
}