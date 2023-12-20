
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsGhazaliatHafezScreen extends StatelessWidget {
  const DetailsGhazaliatHafezScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyAppBar(),
         Expanded(
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: 5,
        left: 29,
        right: 29,
        bottom: 13,
        child: Container(
          decoration:  BoxDecoration(
            border: Border.all(color: MyColors.borderBottomColor),
            color: MyColors.boxBottomColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          height: MediaQuery.of(context).size.height * 0.8, 
         child:  Center(
          child: Column(
            children: [
              const Gap(22),
              Text("غزل شماره 1",style: Theme.of(context)
                   .textTheme
                   .titleLarge!.copyWith(fontSize: 12),),
                    Positioned(
      bottom: 0,
      child: Container(
        // Your additional content here
        child: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            "444444این متن بیش5555تر بشه میاد پایین مثل اینجا",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ))
            ],
            
          ),
          ),
        ),
      ),
        Positioned(
          bottom: -10,
          left: 47,
          right: 47,
          child: Container(
            decoration: const BoxDecoration(
                color: MyColors.musicBoxColor,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
height: MediaQuery.of(context).size.height * 0.12,          
            child: Text("hhhh"),
        ),
      ),
    ],
  ),
),
            const Gap(20),
            const MyBottomNavigation(),
          ],
        ),
      ),
    );
  }
}


