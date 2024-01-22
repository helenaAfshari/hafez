import 'package:flutter/material.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';


class BtmNavItem extends StatelessWidget {
   String iconSvgPath;
  // String text;
  // bool isActive;
  void Function() onTap;
 

  BtmNavItem({super.key, 
     required this.iconSvgPath,
    // required this.text,
    // required this.isActive,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColors.primaryColor,
 
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconSvgPath,

),
             
            ],
          ),
        ),
      ),
    );
  }
}