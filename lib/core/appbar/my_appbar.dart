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
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';


// final GlobalKey<ScaffoldState> _key = GlobalKey();

// AppBar CustomAppBarr(GlobalKey key,BuildContext context) {
//     return AppBar(
//       elevation: 0.0,
//        automaticallyImplyLeading: false,
//       backgroundColor:  MyColors.primaryColor,

//       actions: [
//           Container(
//      width:
//          UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
//      alignment: Alignment.center,
//     // margin: MyPaddings.horizontal20,
//      padding: MyPaddings.all12,
//      decoration: const BoxDecoration(
//       // color:  MyColors.primaryColor,
//      ),
//      child:Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: [
//              GestureDetector(
// //               onTap: () =>Navigator.of(context).pushReplacement(
// // MaterialPageRoute(
// //   builder: (context) =>  HomeScreen();
// // ),
// // ),
//               child: 
//               Icon(Icons.arrow_back,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,)),
//             Gap(MyDimensions.semiLarge-4),
//            Text(MyStrings.ghazaliatHafezText,style: MyTHeme.lightTheme().textTheme.titleLarge,),
//             Gap(MyDimensions.light+3),
//          GestureDetector(
//           onTap: () {
//             _key.currentState!.openEndDrawer();
//           },
//           child: Icon(Icons.menu,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,))
//          ],
//        ),
//          ),
//       ],
//      );
//   }


//    Drawer DrawerCustom() {
//     return Drawer(
//         backgroundColor: MyColors.primaryColor,
//         child:  DrawerHeader(
//           child: ListView(
//             children: [    
//               Image.asset('assets/images/hafez.png',),
//               CustomDivider(endIndent: 10, indent: 10),
//                Gap(MyDimensions.medium),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                    GestureDetector(
//                      onTap: () async {
//                         if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
//                           await launchUrl(Uri.parse(MyStrings.supportLink));
//                         }
//                     },
//                     child: Text(MyStrings.suport,style:  MyTHeme.lightTheme().textTheme.titleLarge,)),
//                   Gap(MyDimensions.xlarge-5),
//                    GestureDetector(
//                      onTap: () async {
//                         if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
//                           await launchUrl(Uri.parse(MyStrings.supportLink));
//                         }
//                     },
//                     child: Image.asset('assets/icons/support.png',)),
//                 ],
//               ),
//                Gap(MyDimensions.medium),
//                  Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () async {
//                         if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
//                           await launchUrl(Uri.parse(MyStrings.websiteLink));
//                         }
//                     },
//                     child:  Text(MyStrings.websiteHafez,style:  MyTHeme.lightTheme().textTheme.titleLarge,)),
//                   Gap(MyDimensions.xlarge-5),
//                    GestureDetector(
//                     onTap: () async {
//                         if(await canLaunchUrl(Uri.parse(MyStrings.websiteLink))){
//                           await launchUrl(Uri.parse(MyStrings.websiteLink));
//                         }
//                     },
//                     child: Image.asset('assets/icons/website.png',)),
//                 ],
//               )
//             ],
//           ) ,),
      
//       );
//   }

//   PreferredSize appBarrrrrrr(String title,BuildContext context) {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(60),
//     child: Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: Center(
//                 child: Text(
//               title,
              
//             )),
//           ),
//         ],
//         leading: GestureDetector(
//           onTap: () {
//             // Get.back();
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: Container(
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                 color: MyColors.primaryColor.withBlue(100),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.keyboard_arrow_right_rounded),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// class CustomLeading extends StatelessWidget {
//   final VoidCallback? onPressed;

//   const CustomLeading({Key? key, this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 16),
//         child: Container(
//           height: 40,
//           width: 40,
//           decoration: BoxDecoration(
//             color: MyColors.primaryColor.withBlue(100),
//             shape: BoxShape.circle,
//           ),
//           child: const Icon(Icons.keyboard_arrow_right_rounded),
//         ),
//       ),
//     );
//   }
// }
class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    this.title = '',
    this.leading,
    this.titleWidget,
    this.showActionIcon = false,
    this.scaffoldKey, // اضافه کردن کلید گلوبال به عنوان ورودی
  });

  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final GlobalKey<ScaffoldState>? scaffoldKey; // تعریف کلید گلوبال به عنوان ورودی

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25 / 10),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: MyTHeme.lightTheme().textTheme.titleLarge,
                      ),
                    )
                  : Center(
                      child: titleWidget!,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: Offset(10, 0),
                    child: InkWell(
                      onTap: () {
                        scaffoldKey?.currentState?.openEndDrawer();
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(MyDimensions.light+2),
                        child: const Icon(Icons.menu),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 100);
}

