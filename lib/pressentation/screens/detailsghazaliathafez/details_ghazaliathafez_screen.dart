
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailsGhazaliatHafezScreen extends StatelessWidget {
  DetailsGhazaliatHafezScreen(int id);
     final List<String> texts = [
    'Text 1',
    'Text 1',
    'Text 1',
    'Text 1',
    'Text 1',
    'Text 1',
  ];  
  final List<String> texts1 = [
    'اااااااااااااااااااااااااااااااااااااااااااااااااااافففففففففففففففففففففففففففففففففففففف',
  ];
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
         child:  Column(
           children: [
             const Gap(22),
             Text("غزل شماره 1",style: Theme.of(context)
                  .textTheme
                  .titleLarge!.copyWith(fontSize: 12),),
SizedBox(
  height:346,
  width: double.infinity,
  child: ListView.builder(
        itemCount: texts.length,
        itemBuilder: (context, index) {
         final text = texts[index];
         final isEvenIndex = index.isEven;
         return 
            Padding(
             padding: EdgeInsets.all(5.0),
             child: Text(
               textAlign: isEvenIndex ? TextAlign.left : TextAlign.right,
               text,
               style: const TextStyle(fontSize: 16.0),
             ),
           );
        },
      ),
),
  Expanded(
  child: Padding(
    padding:  EdgeInsets.only(bottom: MyDimensions.xlarge*5),
    child: CustomDivider(endIndent: 50, indent: 50),
  )),

  Text("تفسیر",style: Theme.of(context)
                  .textTheme
                  .titleLarge!.copyWith(fontSize: 12),),
    const Gap(20),
    SizedBox(
  height:100,
  width: double.infinity,
  child: ListView.builder(
        itemCount: texts1.length,
        itemBuilder: (context, index) {
         final text = texts1[index];
         return 
            Padding(
             padding: const EdgeInsets.only(left: 20,right:20 ),
             child: Text(
               textAlign: TextAlign.right,
               text,
               style: Theme.of(context)
                  .textTheme
                  .titleLarge!.copyWith(fontSize: 10),
             ),
                     );
        },
      ),
),
const Gap(100),
           ],
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
height: MediaQuery.of(context).size.height * 0.10,          
            child: Column(
              children: [
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icons/pause.png',),
                    Image.asset('assets/icons/play.png',),
                    Image.asset('assets/icons/Rectangle.png',),
                  ],
                ),
                const Gap(15),
                LinearPercentIndicator(
                  percent:  1.0,
                  backgroundColor: MyColors.backgroundpercentMusicColor,
                  progressColor: MyColors.percentMusicColor,
                )
              ],
            ),
        ),
      ),
    ],
  ),
),
            const Gap(20),
             MyBottomNavigation(),
          ],
        ),
      ),
    );
  }
}


