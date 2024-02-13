// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hafez/core/components/customwidgets/custom_divider.dart';
// import 'package:hafez/core/resource/constants/my_colors.dart';
// import 'package:hafez/core/resource/constants/my_dimensions.dart';
// import 'package:hafez/core/resource/constants/my_strings.dart';
// import 'package:hafez/core/resource/constants/theme/my_theme.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CustomDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: MyColors.primaryColor,
//       child: DrawerHeader(
//         child: ListView(
//           children: [
//             Image.asset('assets/images/hafez.png'),
//             CustomDivider(endIndent: 10, indent: 10),
//             Gap(MyDimensions.medium),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunchUrl(Uri.parse(MyStrings.supportLink))) {
//                       await launchUrl(Uri.parse(MyStrings.supportLink));
//                     }
//                   },
//                   child: Text(
//                     MyStrings.suport,
//                     style: MyTHeme.lightTheme().textTheme.titleLarge,
//                   ),
//                 ),
//                 Gap(MyDimensions.xlarge - 5),
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunchUrl(Uri.parse(MyStrings.supportLink))) {
//                       await launchUrl(Uri.parse(MyStrings.supportLink));
//                     }
//                   },
//                   child: Image.asset('assets/icons/support.png'),
//                 ),
//               ],
//             ),
//             Gap(MyDimensions.medium),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunchUrl(Uri.parse(MyStrings.websiteLink))) {
//                       await launchUrl(Uri.parse(MyStrings.websiteLink));
//                     }
//                   },
//                   child: Text(
//                     MyStrings.websiteHafez,
//                     style: MyTHeme.lightTheme().textTheme.titleLarge,
//                   ),
//                 ),
//                 Gap(MyDimensions.xlarge - 5),
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunchUrl(Uri.parse(MyStrings.websiteLink))) {
//                       await launchUrl(Uri.parse(MyStrings.websiteLink));
//                     }
//                   },
//                   child: Image.asset('assets/icons/website.png'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CustomDrawerH extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.blue, // Changed to a default color
//       child: DrawerHeader(
//         child: ListView(
//           children: [
//             ListTile(
//                onTap: () async {
//                     if (await canLaunchUrl(Uri.parse('https://example.com'))) {
//                       await launchUrl(Uri.parse('https://example.com'));
//                     }
//                   },
//             title:Text( 'Support') ,leading: Icon(Icons.support),),
//             Image.asset('assets/images/hafez.png'),
//             Divider(endIndent: 10, indent: 10), // Replaced CustomDivider with Divider
//             SizedBox(height: 20), // Replaced Gap with SizedBox
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunchUrl(Uri.parse('https://example.com'))) {
//                       await launchUrl(Uri.parse('https://example.com'));
//                     }
//                   },
//                   child: Text(
//                     'Support',
//                     style: Theme.of(context).textTheme.headlineLarge,
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunch(Uri.parse('https://example.com').toString())) {
//                       await launch(Uri.parse('https://example.com').toString());
//                     }
//                   },
//                   child: Image.asset('assets/icons/support.png'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunch(Uri.parse('https://example.com').toString())) {
//                       await launch(Uri.parse('https://example.com').toString());
//                     }
//                   },
//                   child: Text(
//                     'Website',
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () async {
//                     if (await canLaunch(Uri.parse('https://example.com').toString())) {
//                       await launch(Uri.parse('https://example.com').toString());
//                     }
//                   },
//                   child: Image.asset('assets/icons/website.png'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}