
import 'package:autharization_hanna/core/appbar/my_appbar_items.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/core/resource/constants/my_pading.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
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
              color:  MyColors.primaryColor,
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     MyAppBarItems(
            //       onTap:() {
                    
            //       },
            //       icon: 'assets/icons/history.png', 
              
            //       ),
            //       MyAppBarItems(
            //       onTap:() {
                    
            //       },
            //       icon: 'assets/icons/home.png', 
              
            //       ),
            //       MyAppBarItems(
            //       onTap:() {
                    
            //       },
            //       icon: 'assets/icons/support.png', 
              
            //       ),
            //       ]
            //       ),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Icon(Icons.arrow_back,size: MyDimensions.medium+5),
                  const Gap(20),
                  Text("غزلیات حافظ",style: Theme.of(context)
                     .textTheme
                     .titleLarge,),
                  const Gap(11),
                    Icon(Icons.menu,size: MyDimensions.medium+5),
                    
                ],
              ),
                ),
            );
  }
}