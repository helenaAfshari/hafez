import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navbar_item.dart';
import 'package:autharization_hanna/core/resource/constants/my_pading.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: .1,
      child: 
         Container(
            width:
                UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
            alignment: Alignment.center,
           // margin: MyPaddings.horizontal20,
            padding: MyPaddings.all12,
            decoration: const BoxDecoration(
              color:  Color(0xFFFFDEA4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyBottomNavigationBarItem(
                  onTap:() {
                    
                  },
                  icon: 'assets/icons/history.png', 
              
                  ),
                  MyBottomNavigationBarItem(
                  onTap:() {
                    
                  },
                  icon: 'assets/icons/home.png', 
              
                  ),
                  MyBottomNavigationBarItem(
                  onTap:() {
                    
                  },
                  icon: 'assets/icons/support.png', 
              
                  ),
                  ]
                  ),
                ),
            );
  }
}