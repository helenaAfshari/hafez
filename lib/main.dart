
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_fav.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
      ],
      child:  MaterialApp(

        theme: MyTHeme.lightTheme(),
        // home: const HomeScreen(),
        home: PageViewDemo(),
        // initialRoute: ScreenNames.mainScreen,
        // routes: routes,
      ),
    );
  }
}

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
    height:  737,
     child: PageView(
      controller: _controller,
      children: [
        HomeScreen(),
        GhazaliatHafezScreen(),
        GhazaliatFav(),
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
    currentIndex: selectedPage,
   items: [
   
    BottomNavigationBarItem(label: "لیست غزلیات حافظ",icon: Image.asset('assets/icons/list.png')),
     BottomNavigationBarItem(
      backgroundColor: MyColors.borderBottomColor,
      label: "خانه",icon: Image.asset('assets/icons/home.png')),
    BottomNavigationBarItem(label: "مورد علاقه ها",icon: Image.asset('assets/icons/heart.png')),
   ],
   onTap: (int index) {
     _controller.animateToPage(index, duration: const Duration(microseconds: 1000), curve: Curves.easeIn);
   },
  );
}
onPageChange(int index){
 setState(() {
   selectedPage = index;
 });
}
}