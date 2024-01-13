
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyBottomNavigationBarItem extends StatelessWidget {
  const MyBottomNavigationBarItem({
    super.key, 
   // required this.title, 
    required this.icon, 
    required this.onTap, 
  });

  //final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(icon), // مسیر تصویر را به جای 'assets/images/your_image.png' قرار دهید

         // Gap(MyDimensions.light),
          // Text(
          //   title,
          //   style: Theme.of(context).textTheme.displayMedium?.copyWith(
          //     fontWeight: isSelected ? FontWeight.w700: FontWeight.w400,
          //   ),
          // ),
        ],
      ),
    );
  }
}