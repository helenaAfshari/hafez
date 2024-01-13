import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  double? height;
  double? width;
  String? text;
  BorderRadius? borderRadius;
  Border? border;
  Widget? myIcon;
  EdgeInsets? margin;
  Color? color;
  List<Color>? gradient;
  Color? textColor;
  FontStyle? fontStyle;
  SvgPicture? image;
  double? fontSize;
  VoidCallback? onPress;
  final TextStyle? textStyle; // اضافه شده

  double? iconPadding;

  CustomButtonWidget(
      {super.key,
      this.height,
      this.textStyle,
      this.iconPadding,
      this.width,
      this.margin,
      this.image,
      this.gradient,
      this.fontStyle,
      this.borderRadius,
      this.border,
      this.textColor,
      this.fontSize,
      this.color,
      this.text,
      this.myIcon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        width: width,
        height: height,
        padding:MyPaddings.all8,
        decoration: BoxDecoration(
          color: color,
         // gradient: gradient,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Row(
          children: [
              Padding(
                padding: EdgeInsets.only(right: iconPadding ?? 0),
                child: myIcon,
              ),
            if (text != null)
              Expanded(
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}