
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
double endIndent;
double indent;
CustomDivider({required this.endIndent,required this.indent});
  @override
  Widget build(BuildContext context) {
    return   Divider(
    endIndent: endIndent,
    indent: indent,
    color: MyColors.dividerColor,);
  }
}