import 'package:hafez/core/bottomnavigationbar/my_bottom_navbar_item.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_fav.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hafez/route/names.dart';
// class MyBottomNavigation extends StatelessWidget {
  
//   const MyBottomNavigation({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        width:
//            UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
//        alignment: Alignment.center,
//       // margin: MyPaddings.horizontal20,
//        padding: MyPaddings.all12,
//        decoration: const BoxDecoration(
//          color:  Color(0xFFFFDEA4),
//        ),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            MyBottomNavigationBarItem(
//                onTap: () {
//                 Navigator.pushNamed(context, ScreenNames.ghazaliatHafezScreen);
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => const GhazaliatHafezScreen()),
//     // );
//   },
//     icon: 'assets/icons/list.png', 
// ),
//              MyBottomNavigationBarItem(
//              onTap:() {
//                   Navigator.pushNamed(context, ScreenNames.homeScreen);
//              },
//              icon: 'assets/icons/home.png', 
//              ),
//  MyBottomNavigationBarItem(
//   onTap: () {
//          Navigator.pushNamed(context, ScreenNames.favoriteScreen);
//   },
//   icon: 'assets/icons/heart.png',
// ),

//          ]
//        ),
//              );
          
//   }
// }

// class MyBottomNavigation extends StatefulWidget {
//   @override
//   _MyBottomNavigationState createState() => _MyBottomNavigationState();
// }

// class _MyBottomNavigationState extends State<MyBottomNavigation> {
//   int _currentIndex = 0; // شاخص فعلی

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: [
//           GhazaliatHafezScreen(),
//           HomeScreen(),
//           DetailsGhazaliatHafezScreen(),
//         ],
//       ),
//       bottomNavigationBar: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           MyBottomNavigationBarItem(
//             onTap: () {
//               setState(() {
//                 _currentIndex = 0; // تغییر شاخص به صفحه GhazaliatHafezScreen
//               });
//             },
//             icon: 'assets/icons/history.png',
//           ),
//           MyBottomNavigationBarItem(
//             onTap: () {
//               setState(() {
//                 _currentIndex = 1; // تغییر شاخص به صفحه HomeScreen
//               });
//             },
//             icon: 'assets/icons/home.png',
//           ),
//           MyBottomNavigationBarItem(
//             onTap: () {
//               setState(() {
//                 _currentIndex = 2; // تغییر شاخص به صفحه DetailsGhazaliatHafezScreen
//               });
//             },
//             icon: 'assets/icons/support.png',
//           ),
//         ],
//       ),
//     );
//   }
// }
