// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hafez/core/resource/constants/my_colors.dart';
// import 'package:hafez/core/resource/constants/my_dimensions.dart';
// import 'package:hafez/core/resource/constants/my_pading.dart';
// import 'package:hafez/core/resource/constants/my_strings.dart';
// import 'package:hafez/core/resource/constants/theme/my_theme.dart';
// import 'package:hafez/core/utils/ui_utils.dart';


// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//  GlobalKey<ScaffoldState> key = GlobalKey();

//    MyAppBar({ required this.key});

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0.0,
//       automaticallyImplyLeading: false,
//       backgroundColor: MyColors.primaryColor,
//       actions: [
//         Container(
//           width: UIUtils.getConvertedWidth(
//               context, UIUtils.screenWidthInFigma),
//           alignment: Alignment.center,
//           padding: MyPaddings.all12,
//           decoration: const BoxDecoration(
//             // color: MyColors.primaryColor,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: Icon(Icons.arrow_back,
//                     size: MyDimensions.medium + 5,
//                     color: MyColors.primaryButtonColor),
//               ),
//               Gap(MyDimensions.semiLarge - 4),
//               Text(
//                 MyStrings.ghazaliatHafezText,
//                 style: MyTHeme.lightTheme().textTheme.titleLarge,
//               ),
//               Gap(MyDimensions.light + 3),
//               GestureDetector(
//                 onTap: () {
//                   key.currentState!.openEndDrawer();
//                 },
//                 child: Icon(Icons.menu,
//                     size: MyDimensions.medium + 5,
//                     color: MyColors.primaryButtonColor),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

AppBar CustomAppBarr(GlobalKey key,BuildContext context) {
    return AppBar(
      elevation: 0.0,
       automaticallyImplyLeading: false,
      backgroundColor:  MyColors.primaryColor,

      actions: [
          Container(
     width:
         UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
     alignment: Alignment.center,
    // margin: MyPaddings.horizontal20,
     padding: MyPaddings.all12,
     decoration: const BoxDecoration(
      // color:  MyColors.primaryColor,
     ),
     child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
             GestureDetector(
//               onTap: () =>Navigator.of(context).pushReplacement(
// MaterialPageRoute(
//   builder: (context) =>  HomeScreen();
// ),
// ),
              child: 
              Icon(Icons.arrow_back,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,)),
            Gap(MyDimensions.semiLarge-4),
           Text(MyStrings.ghazaliatHafezText,style: MyTHeme.lightTheme().textTheme.titleLarge,),
            Gap(MyDimensions.light+3),
         GestureDetector(
          onTap: () {
            _key.currentState!.openEndDrawer();
          },
          child: Icon(Icons.menu,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,))
         ],
       ),
         ),
      ],
     );
  }


   Drawer DrawerCustom() {
    return Drawer(
        backgroundColor: MyColors.primaryColor,
        child:  DrawerHeader(
          child: ListView(
            children: [    
              Image.asset('assets/images/hafez.png',),
              CustomDivider(endIndent: 10, indent: 10),
               Gap(MyDimensions.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   GestureDetector(
                     onTap: () async {
                        if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
                          await launchUrl(Uri.parse(MyStrings.supportLink));
                        }
                    },
                    child: Text(MyStrings.suport,style:  MyTHeme.lightTheme().textTheme.titleLarge,)),
                  Gap(MyDimensions.xlarge-5),
                   GestureDetector(
                     onTap: () async {
                        if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
                          await launchUrl(Uri.parse(MyStrings.supportLink));
                        }
                    },
                    child: Image.asset('assets/icons/support.png',)),
                ],
              ),
               Gap(MyDimensions.medium),
                 Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                        if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
                          await launchUrl(Uri.parse(MyStrings.websiteLink));
                        }
                    },
                    child:  Text(MyStrings.websiteHafez,style:  MyTHeme.lightTheme().textTheme.titleLarge,)),
                  Gap(MyDimensions.xlarge-5),
                   GestureDetector(
                    onTap: () async {
                        if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
                          await launchUrl(Uri.parse(MyStrings.websiteLink));
                        }
                    },
                    child: Image.asset('assets/icons/website.png',)),
                ],
              )
            ],
          ) ,),
      
      );
  }