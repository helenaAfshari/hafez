import 'package:flutter/material.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_favorite.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController();
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(body: Column(
      children: [
        buildPageView(),
        buildBottomNav(),
      ],
    ),));
  }

Widget buildPageView(){
   return SizedBox(
    height:737,
     child: PageView(
      controller: _controller,
      children: const [
         // HomeScreen(),
        GhazaliatHafezScreen(),
        //GhazaliatFav(),
      ],
      onPageChanged: (index) {
        onPageChange(index);
      },
     ),
   );
}
Widget buildBottomNav(){
  return BottomNavigationBar(
    backgroundColor:MyColors.bottomNavigationBarBackgroundColor,
    selectedItemColor: MyColors.textColor,
    currentIndex: selectedPage,
   items: [
    BottomNavigationBarItem(
      backgroundColor: MyColors.borderBottomColor,
      label: "خانه",icon: Image.asset('assets/icons/home.png')),
    BottomNavigationBarItem(label: "لیست غزلیات حافظ",icon: Image.asset('assets/icons/list.png')),
    BottomNavigationBarItem(label: "مورد علاقه ها",icon: Image.asset('assets/icons/heart.png')),
   ],
   onTap: (int index) {
    
      _controller.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
   },
  );
}
onPageChange(int index){
 setState(() {
   selectedPage = index;
 });
}
}



// import 'package:flutter/material.dart';
// import 'package:hafez/core/resource/constants/my_colors.dart';
// import 'package:hafez/pressentation/mainscreen/btm_nav_item.dart';
// import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_fav.dart';
// import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
// import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';

// class BtmNavScreenIndex {
//   BtmNavScreenIndex._();
//   static const home = 0;
//   static const ghazaliatHafez = 1;
//   static const favoriteGhazaliatHafez = 2;
// }

// class MainScreen extends StatefulWidget {
//   MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final List<int> _routeHistory = [BtmNavScreenIndex.home];

//   int selectedIndex = BtmNavScreenIndex.home;
//   final GlobalKey<NavigatorState> _homeKey = GlobalKey();
//   final GlobalKey<NavigatorState> _ghazaliatHafez = GlobalKey();
//   final GlobalKey<NavigatorState> _favoriteGhazaliatHafez = GlobalKey();

//   late final map = {
//     BtmNavScreenIndex.home: _homeKey,
//     BtmNavScreenIndex.ghazaliatHafez: _ghazaliatHafez,
//     BtmNavScreenIndex.favoriteGhazaliatHafez: _favoriteGhazaliatHafez,
//   };

//   // map[0] => _homeKey
//   // map[1] => _basketKey
//   // map[2] => _profileKey

//   Future<bool> _onWillPop() async {
//     if (map[selectedIndex]!.currentState!.canPop()) {
//       map[selectedIndex]!.currentState!.pop();
//     } else if (_routeHistory.length > 1) {
//       setState(() {
//         _routeHistory.removeLast();
//         selectedIndex = _routeHistory.last;
//       });
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     double btmNavHeight = size.height * .1;
//     return WillPopScope(
//       onWillPop:_onWillPop,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 bottom: btmNavHeight,
//                 child: IndexedStack(
//                   index: selectedIndex,
//                   children: [
//                        Navigator(
//                       key: _homeKey,
//                       onGenerateRoute: (settings) => MaterialPageRoute(
//                           builder: (context) =>  HomeScreen()),
//                     ),
//                     Navigator(
//                       key: _ghazaliatHafez,
//                       onGenerateRoute: (settings) => MaterialPageRoute(
//                           builder: (context) => const GhazaliatHafezScreen()),
//                     ),
//                        Navigator(
//                       key: _favoriteGhazaliatHafez,
//                       onGenerateRoute: (settings) => MaterialPageRoute(
//                           builder: (context) => const GhazaliatFav()),
//                     ),
//                   ],
//                 )),
//             Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: MyColors.primaryColor,
//                   height: btmNavHeight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       BtmNavItem(
//                          iconSvgPath: 'assets/icons/list.png',
//                           onTap: () => btmNavOnPressed(
//                               index: BtmNavScreenIndex.ghazaliatHafez)),
//                       BtmNavItem(
//                         iconSvgPath: 'assets/icons/home.png',
//                           onTap: () =>
//                               btmNavOnPressed(index: BtmNavScreenIndex.home)),
//                       BtmNavItem(
//                         iconSvgPath: 'assets/icons/heart.png',
//                           onTap: () =>
//                               btmNavOnPressed(index: BtmNavScreenIndex.favoriteGhazaliatHafez)),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   btmNavOnPressed({required index}) {
//     setState(() {
//       selectedIndex = index;
//       _routeHistory.add(selectedIndex);
//     });
//   }
// }