
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/bottomnavigationbar/custom_buttom_navigation.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/bloc_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:hafez/pressentation/screens/estekhare/estekhare_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/widgets/list_buttoms_widget.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
     SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
     if(!kIsWeb){
 Directory dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  }else{
    Hive.defaultDirectory = './';
    // Isar.
  }
  await injector();
  runApp(
  MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GhazaliatHafezBloc>(
          create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
        ),
        BlocProvider<DetailsGhazaliatHafezBloc>(
            create: (context) =>
          DetailsGhazaliatHafezBloc()..add(LoadedddEvent(0))),

           BlocProvider<BlocEstekhare>(
            create: (context) =>
          BlocEstekhare()..add(EstekhareLoadedEvent(0))),
      ],
      child:  MaterialApp(
        theme: MyTHeme.lightTheme(),
        home:  CustomBottomNavigation(),
       // home:  SamplePageView(),
        //  initialRoute: ScreenNames.homeScreen,
        //  routes: routes,
      ),
    );
  }
}






class CustomClickableImage extends StatelessWidget {
  final int index;
  final List<GhazalItemModelEntity> ghazalItems;
  final bool isClicked;
  final Offset? tapPosition;

  const CustomClickableImage({
    required this.index,
    required this.ghazalItems,
    required this.isClicked,
    required this.tapPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        // navigateToDetailsScreen(index);
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Goldfinger.jpg'),
              ),
            ),
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isClicked ? 1.0 : 0.0,
              child: Lottie.asset('assets/lottie/anim.json'),
            ),
          ),
          if (isClicked && tapPosition != null)
            Positioned(
              left: tapPosition!.dx - 1,
              top: 0,
              right: MediaQuery.of(context).size.width - tapPosition!.dx - 1,
              bottom: 0,
              child: Container(
                width: 2,
                height: 10,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

//   void navigateToDetailsScreen(int index) {
//     int adjustedIndex = index < 17 ? index + 1 : index + 1;
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailsGhazaliatHafezScreen(
//           e: ghazalItems[index],
//           index: adjustedIndex,
//         ),
//       ),
//     );
//   }
// }


// class First extends StatelessWidget {
//   const First(
    
//      this.pageController,
//   ) : super();

//   final   PageController pageController;

//   @override
//   Widget build(BuildContext context) {
//     return
//     Scaffold(
//           backgroundColor: MyColors.primaryColor,
//       body: SizedBox(
//         height:
//               UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
//           width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//              Gap(MyDimensions.xlarge+60),
//             Center(child: Image.asset('assets/images/hafez.png')),
//              Gap(MyDimensions.xlarge+55),
//             Expanded(
//               child: ListView.separated(
//                 physics: const ScrollPhysics(),
//                 itemBuilder: (context, index) {
//                  return listBottomsWidget(index,context);
    
//                 },
//                 separatorBuilder: (context, index) =>  Gap(MyDimensions.small+1),
//                 itemCount: 1,
//               ),
//             ),
//              Gap(MyDimensions.large-2),
          
//                //MyBottomNavigation(pageController),
//           ],
//         ),
//       ),
//     );
// //     Scaffold(
// //   body: Column(
// //     children: [
// //       Expanded(
// //         child: Container(
// //           color: Colors.green,
// //           child: Column(
// //             children: [
// //               Text('First page'),
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     child: Text('Next'),
// //                     onPressed: () => pageController.nextPage(
// //                       duration: Duration(milliseconds: 100),
// //                       curve: Curves.ease,
// //                     ),
// //                   )
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //       Align(
// //         alignment: Alignment.bottomCenter,
// //         child: Container(
// //           color: Colors.blue,  // رنگ مورد نظر خود را قرار دهید
// //           height: 56.0,  // ارتفاع مورد نظر خود را قرار دهید
// //           child: Row(
// //             // اطلاعات مربوط به bottom bar خود را اضافه کنید
// //             children: [
// //           IconButton(
// //   icon: Icon(Icons.favorite),
// //   onPressed: () {
// //     // انجام عملیات مربوط به favorite
// //     pageController.animateToPage(
// //       1,  // شماره صفحه برای انتقال به آن (0 معمولاً به صفحه خانه اشاره دارد)
// //       duration: Duration(milliseconds: 100),
// //       curve: Curves.ease,
// //     );
// //   },
// // ),

// //               IconButton(
// //                 icon: Icon(Icons.favorite),
// //                 onPressed: () {
// //                   // انجام عملیات مربوط به favorite
// //                 },
// //               ),
// //               // ...
// //             ],
// //           ),
// //         ),
// //       ),
// //     ],
// //   ),
// // );


//   }
// }

}
