

import 'package:autharization_hanna/core/components/customwidgets/custom_button.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:flutter/material.dart';

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
    textStyle:Theme.of(context)
    .textTheme
    .titleLarge,
    onPress: () {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const GhazaliatHafezScreen(),));
  },);
}