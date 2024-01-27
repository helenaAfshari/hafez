import 'package:hafez/core/bottomnavigationbar/my_bottom_navbar_item.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/main.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_fav.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:hafez/pressentation/screens/hand.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hafez/route/names.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;
  List<Widget> body=[
    Hand(),
    HomeScreen(),
    GhazaliatFavorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return false; // Prevent default back navigation
        }
        return true; // Allow default back navigation
      },
      child: Scaffold(
        body: Center(child: body[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:MyColors.selectedButtonNavBarColor,
          backgroundColor: MyColors.bottomNavigationBarBackgroundColor,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items:  [
            BottomNavigationBarItem(
              label: 'استخاره',
              icon: Image.asset('assets/icons/list.png'),
            ),
            BottomNavigationBarItem(
              label: 'خانه',
              icon: Image.asset('assets/icons/home.png'),
            ), 
            BottomNavigationBarItem(
              label: 'مورد علاقه',
              icon: Image.asset('assets/icons/heart.png'),
            ),
          ],
        ),
      ),
    );
  }
}


// class BottomBarWidgets extends StatefulWidget {
//   const BottomBarWidgets({super.key});

//   @override
//   State<BottomBarWidgets> createState() => _BottomBarWidgetsState();
// }

// class _BottomBarWidgetsState extends State<BottomBarWidgets> {
//   int _currentIndex = 0;
//   List<Widget> body=[
//     GhazaliatHafezScreen(),
//     HomeScreen(),
//     GhazaliatFavorite(),

//   //  Icon(Icons.home),
//   //  Icon(Icons.face),
//   //  Icon(Icons.abc_outlined),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: body[_currentIndex]),
//       bottomNavigationBar: BottomNavigationBar(
//       currentIndex: _currentIndex,
//      onTap: (int newIndex) {
//     setState(() {
//       _currentIndex = newIndex;
//       if (_currentIndex == 2) {
//         Navigator.of(context).pop();
//       }
//     });
//   },
//       items:  [
//         BottomNavigationBarItem(
//           label: 'list',
//           icon: Image.asset('assets/icons/list.png'),
//           ),
//            BottomNavigationBarItem(
//           label: 'home',
//          icon: Image.asset('assets/icons/home.png'),
//           ), 
//           BottomNavigationBarItem(
//           label: 'favorite',
//          icon: Image.asset('assets/icons/heart.png'),
//           ),
          
//       ],
//       ),
//     );
//   }
// }





// class MyBottomNavigation extends StatelessWidget {
  
//   //  MyBottomNavigation(
//   //   this.pageController,
//   // );
//   // final   PageController pageController;
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
//     //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GhazaliatHafezScreen(),));
//   // Navigator.pushReplacementNamed(context, ScreenNames.ghazaliatHafezScreen);
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) => GhazaliatHafezScreen (),));

//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => const GhazaliatHafezScreen()),
//     // );
//   },
//     icon: 'assets/icons/list.png', 
// ),
//              MyBottomNavigationBarItem(
//              onTap:() {
//                 //  Navigator.pushNamed(context, ScreenNames.homeScreen);
//              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomeScreen(),));
//  // Navigator.pushReplacementNamed(context, ScreenNames.homeScreen);
//              },
//              icon: 'assets/icons/home.png', 
//              ),
//  MyBottomNavigationBarItem(
//   onTap: () {
//         //  Navigator.pushNamed(context, ScreenNames.favoriteScreen);
//        // Navigator.pushReplacementNamed(context, ScreenNames.favoriteScreen);
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  GhazaliatFav(),));
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
//   State<MyBottomNavigation> createState() => _MyBottomNavigationState();
// }

// class _MyBottomNavigationState extends State<MyBottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     int selected = 1;
//     return NavigationBar(
//       backgroundColor: Colors.amber,
//       selectedIndex: selected,
//       onDestinationSelected: (int index) {
//      setState(() {
//     if (selected != index) {
//       //selected = index;
   
//       switch (index) {
//         case 0:
//           Navigator.pushReplacementNamed(context, ScreenNames.homeScreen);
          
//           break;
//         case 1:
//           Navigator.pushNamed(context, ScreenNames.ghazaliatHafezScreen);
//           break;
//         case 2:
//           Navigator.pushReplacementNamed(context, ScreenNames.favoriteScreen);
         

//           break;
//         // ادامه برای صفحات دیگر
//       }
//     }
//   });
//       //   setState(() {
//       // selected = index;
//       //   });
//       },
//       destinations: [
//         NavigationDestination(
//           icon: Icon(Icons.face) , 
//           label: "gggg"),
//            NavigationDestination(
//           icon: Icon(Icons.abc_rounded) , 
//           label: "llll"),
//            NavigationDestination(
//           icon: Icon(Icons.access_alarm_outlined) , 
//           label: "aaaa"),
          
//       ]
//       );
          
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
