import 'package:autharization_hanna/core/resource/constants/theme/my_theme.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/screens/learn_hive/hive_screen_page.dart';
import 'package:autharization_hanna/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:autharization_hanna/pressentation/screens/learn_hive/true_hive_list.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/bloc_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/toggle_screen.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_bloc.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/services.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pressentation/screens/toggleScreenAndBloc/event_toggle.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await injector();
  await Hive.initFlutter();
   Hive.registerAdapter(FavoriteModelAdapter());
    await Hive.openBox<FavoriteModel>('myBox'); // باز کردن باکس
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(
      providers: [
        BlocProvider<GhazaliatHafezBloc>(
          create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
        ),  
        BlocProvider<DetailsGhazaliatHafezBloc>(
          create: (context) => DetailsGhazaliatHafezBloc()..add(LoadedddEvent(0))),
          BlocProvider<BadgeBloc>(
          create: (context) => BadgeBloc(box:BadgeDatabase())..add(ChangeColorButtomListClickedEvent(0,false))),
      ],
      child:  MaterialApp(
        title: 'Your App Title',
        home: GhazaliatHafezScreen(),
      ),
    );
  }
}
// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:path_provider/path_provider.dart' as path_provider;

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //  await Hive.initFlutter();
// //   await Hive.openBox('shoping_box');

// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home:TrueHiveList (),
// //     );
// //   }
// // }

// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('دکمه با دیتابیس Hive'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.list),
// //             onPressed: () {
// //               // نمایش اطلاعات ذخیره شده در دیتابیس Hive
// //               showHiveData(context);
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: () {
// //                 addToHive(context);
// //               },
// //               child: Text('اضافه کردن به دیتابیس'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void addToHive(BuildContext context) {
// //     final myBox = Hive.box('myBox');
// //     myBox.add('اطلاعات جدید: ${DateTime.now()}');

// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text('اطلاعات با موفقیت به دیتابیس اضافه شد.'),
// //     ));
// //   }

// //   void showHiveData(BuildContext context) {
// //     final myBox = Hive.box('myBox');
    
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('اطلاعات ذخیره شده در دیتابیس Hive'),
// //           content: Column(
// //             children: List.generate(
// //               myBox.length,
// //               (index) => ListTile(
// //                 title: Text(myBox.getAt(index)),
// //               ),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('بستن'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }



// // import 'package:flutter/material.dart';

// // Future<void> main()async {
// //    WidgetsFlutterBinding.ensureInitialized();
// //   await injector();
// //   await Hive.initFlutter();
// //   //Hive.openBox<FavoriteModel>('favorites');
// //  await Hive.openBox('shoping_box');
// //   Hive.registerAdapter(FavoriteModelAdapter());
// //   runApp( MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHiveScreen(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('BottomSheet Example'),
// //       ),
// //       body: Center(
// //         child: GestureDetector(
// //           onTap: () {
// //             _showBottomSheet(context);
// //           },
// //           child: Text(
// //             'hhh',
// //             style: TextStyle(
// //               fontSize: 24,
// //               color: Colors.blue,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _showBottomSheet(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext builder) {
// //         return Container(
// //           height: 200,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text(
// //                 'This is a BottomSheet',
// //                 style: TextStyle(fontSize: 20),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: Text('Close'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }




// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   bool isVisible = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Animated List Example'),
// //       ),
// //       body: Stack(
// //         children: [
// //           Visibility(
// //             visible: isVisible,
// //             child: Container(
// //               height: 200,
// //               child: ListView.builder(
// //                 itemCount: 10,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     title: Text('آیتم $index'),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(top: 210),
// //             child: TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   isVisible = !isVisible;
// //                 });
// //                 print("visible::::$isVisible");
// //               },
// //               child: Text("تفسیر"),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// // import 'package:flutter/material.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'ExpansionTile Collapse',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'ExpansionTile Collapse'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({ required this.title}) : super();

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {

// //   // selected's value = 0. For default first item is open.
// //   int selected = 0; //attention

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,title: Text('ExpansionTile Collapse', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
// //       ),
// //       body: Container(color: Colors.white,
// //           child: SingleChildScrollView(
// //               child : Column( 
// //                 children : [                  
// //                   ListView.builder(

// //                       key: Key('builder ${selected.toString()}'), //attention

// //                       padding: EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
// //                       shrinkWrap: true,
// //                       physics: NeverScrollableScrollPhysics(),
// //                       itemCount: 5,
// //                       itemBuilder: (context, index) {                        
// //                         return Column(
// //                           children: <Widget>[
// //                             Divider(
// //                               height: 17.0,
// //                               color: Colors.white,
// //                             ), 
// //                                   ExpansionTile(  

// //                                         key: Key(index.toString()), //attention                                                                  
// //                                         initiallyExpanded : index==selected, //attention

// //                                         leading: Icon(Icons.person, size: 50.0, color: Colors.black,),
// //                                         title: Text('Faruk AYDIN ${index}',style: TextStyle(color: Color(0xFF09216B), fontSize: 17.0, fontWeight: FontWeight.bold)), 
// //                                         subtitle: Text('Software Engineer', style: TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold),),
// //                                         children: <Widget>[                                       
// //                                           Padding(padding: EdgeInsets.all(25.0), 
// //                                                       child : Text('DETAİL ${index} \n' + 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English.',)
// //                                                       ) 
// //                                         ],
// //                                         onExpansionChanged: ((newState){
// //                                             if(newState)
// //                                                 setState(() {
// //                                                   Duration(seconds:  20000);
// //                                                   selected = index; 
// //                                                 });
// //                                                 else setState(() {
// //                                                   selected = -1; 
// //                                                 });        
// //                                         })
// //                                       ),

// //                               ]
// //                             );
// //                       },
// //                         )
// //                 ]
// //                     ),
// //           )           
// //         )
// //     );
// //   }
// // }







// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   final GlobalKey<_CustomExpansionTileState> expansionTileKey =
// //       GlobalKey<_CustomExpansionTileState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Custom Expansion Tile'),
// //       ),
// //       body: Column(
// //         children: [
// //           CustomExpansionTile(
// //             key: expansionTileKey,
// //             title: Text("تفسیر"),
// //             children: [
// //               Text("kkkkk"),
// //               Text("kkkkk"),
// //               Text("kkkkk"),
// //             ],
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // با فراخوانی toggleExpansion می‌توانید وضعیت باز یا بسته بودن را تغییر دهید
// //           expansionTileKey.currentState?.toggleExpansion();
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // class CustomExpansionTile extends StatefulWidget {
// //   final Widget title;
// //   final List<Widget> children;

// //   const CustomExpansionTile({
// //     Key? key,
// //     required this.title,
// //     required this.children,
// //   }) : super(key: key);

// //   @override
// //   _CustomExpansionTileState createState() => _CustomExpansionTileState();
// // }

// // class _CustomExpansionTileState extends State<CustomExpansionTile>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _heightFactor;

// //   bool _isExpanded = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 300),
// //     );
// //     _heightFactor = _controller.drive(CurveTween(curve: Curves.bounceInOut));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         ListTile(
// //           title: widget.title,
// //           onTap: _toggleExpansion,
// //         ),
// //         ClipRect(
// //           child: Align(
// //             heightFactor: _heightFactor.value,
// //             child: Column(
// //               children: widget.children,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   void _toggleExpansion() {
// //     setState(() {
// //       _isExpanded = !_isExpanded;
// //     });

// //     if (_isExpanded) {
// //     _controller.reverse();
// //     } else {
// //        _controller.forward();
      
// //     }
// //   }

// //   void toggleExpansion() {
// //     _toggleExpansion();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }



// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final appDocumentDirectory =
//       await path_provider.getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDirectory.path);
  
//   await Hive.openBox('myBox'); // ایجاد یک باکس با نام 'myBox'

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Box _myBox;

//   @override
//   void initState() {
//     super.initState();
//     _myBox = Hive.box('myBox');
//   }

//   Color _getButtonColor(BadgeState state, int index) {
//     print("Current state: $state");

//     bool isClicked = _myBox.get('isClicked$index', defaultValue: false);

//     return (isClicked)
//         ? Color.fromARGB(255, 13, 15, 16)
//         : const Color.fromARGB(255, 161, 156, 139);
//   }

//   void _onButtonClick(int index) {
//     bool isClicked = _myBox.get('isClicked$index', defaultValue: false);
//     _myBox.put('isClicked$index', !isClicked);

//     // انجام سایر عملیات مرتبط با کلیک دکمه
//   }

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Your App Title'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // افزودن سایر ویجت‌های UI به دلخواه

//           ElevatedButton(
//             onPressed: () {
//               // فراخوانی تابع مرتبط با کلیک دکمه
//               _onButtonClick(0);
//             },
//             style: ElevatedButton.styleFrom(
//               primary: _getButtonColor(BadgeState.yourState, 0),
//               padding: EdgeInsets.all(16),
//             ),
//             child: Text('Button 1'),
//           ),

//           ElevatedButton(
//             onPressed: () {
//               // فراخوانی تابع مرتبط با کلیک دکمه
//               _onButtonClick(1);
//             },
//             style: ElevatedButton.styleFrom(
//               primary: _getButtonColor(BadgeState, 1),
//               padding: EdgeInsets.all(16),
//             ),
//             child: Text('Button 2'),
//           ),

//           // افزودن دکمه‌های دیگر به دلخواه

//         ],
//       ),
//     ),
//   );
// }

// }
