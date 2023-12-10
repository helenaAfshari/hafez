
import 'package:flutter/cupertino.dart';

class UIUtils {
  static const double screenWidthInFigma = 360;
  static const double screenHeightInFigma = 800;

  static double getConvertedWidth(BuildContext context, double figmaWidth) {
    return MediaQuery.of(context).size.width * (figmaWidth / screenWidthInFigma);
  }
  static double getConvertedHeight(BuildContext context, double figmaHeight) {
    return (MediaQuery.of(context).size.height) * figmaHeight / screenHeightInFigma;
  }
}