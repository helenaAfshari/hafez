
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/appbar/my_appbar.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/bloc_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/state_estekhare.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/tamrin/bloc_tamrin.dart';
import 'package:hafez/pressentation/blocs/tamrin/event_tamrin.dart';
import 'package:hafez/pressentation/blocs/tamrin/state_tamrin.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';


class EstekhareScreen extends StatefulWidget {
      GhazalItemModelEntity? ghazaliat;
  // int? index ;
  @override
  _EstekhareScreenState createState() => _EstekhareScreenState();
}
class _EstekhareScreenState extends State<EstekhareScreen> {
   BlocEstekhare blocEstekharee = BlocEstekhare();

  final GlobalKey<ScaffoldState> _estekhareKey = GlobalKey();
   int indexxxxx=0;
   int indext =0;
int aaaa= 50;
Color _colorContainer = Colors.transparent;
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        opacity = 0;
      });

    });
 // BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(k.length,_isClicked,));
  //BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent());
//  BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(widget.e!.id!));
  
  }
  double opacity = 1.0;
  bool _isClicked =false;
  bool _isClickedd =false;
  Offset? _tapPosition;



//  int nextNumber({required int index}) {
//     int clickCount = 0; // تعداد کلیک‌ها را حساب می‌کند
//     bool isLimitReached = false; // برای اطمینان از رسیدن به حداکثر تعداد کلیک‌ها
//     late int limit = 2; // تعداد مجاز تولید اعداد تصادفی

//     if (!isLimitReached) { // تنها اگر به حداکثر تعداد کلیک‌ها نرسیده باشیم
//       clickCount++; // تعداد کلیک‌ها را افزایش می‌دهیم
//       if (clickCount >= limit) { // اگر تعداد کلیک‌ها بیشتر یا مساوی حداکثر مجاز باشد
//         isLimitReached = true; // وضعیت رسیدن به حداکثر تعداد کلیک‌ها را به true تغییر می‌دهیم
//         print('You have reached the maximum number of clicks.'); // اطلاع رسانی به کاربر
//       } else {
//         int randomNumber = Random().nextInt(limit); // تولید عدد تصادفی
//         print('Random Number: $randomNumber');
//         return randomNumber;
//       }
//     }
//     return -1; // یا مقدار خاصی که مد نظر شما باشد
//   }

//  generateRandomNumber(BuildContext context) {
//     final bloc = BlocProvider.of<BlocEstekhare>(context);
//     int randomNumber = bloc.nextNumber(index: 100); // تولید عدد تصادفی
//     print('Random Number: $randomNumber');

//     // اینجا می‌توانید دستورات دیگری را اجرا کنید، مانند نمایش اطلاعات در صفحه یا ارسال رویداد به بلوک
//   }
  // generateRandomNumber() {
  // int randomNumber = blocEstekharee.nextNumber(index: 400); // مثال: تولید عدد تصادفی بین 0 و 100
  //   print('Random Number: $randomNumber');
  //   return blocEstekharee.nextNumber(index: 400);
  // }

  @override
  Widget build(BuildContext context) {
    //BlocEstekhare ssss = context.read<BlocEstekhare>();
    return 
   SafeArea(
     child: Scaffold(
       key: _estekhareKey,
        endDrawer: Drawer(
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
        ),
        extendBodyBehindAppBar: true,
        appBar: CustomAppBarWidget(
      scaffoldKey: _estekhareKey,
      showActionIcon: true,
      title: MyStrings.ghazaliatHafezText,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const BackButton()),
        ),
        body: 
     
  //           BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
  //              if(state is SuccesEstekhareState){
  //                     List<GhazalItemModelEntity> k = state.ghazaliatHafezEstekhare;

  //                return
  //                GestureDetector(
  //     child:  Stack(
  //     children: [
  //           Container(
  //             height: double.infinity,
  //             decoration: const BoxDecoration(
  //               image: DecorationImage(
  //                 fit: BoxFit.fill,
  //                 image: AssetImage('assets/images/Goldfinger.jpg'),
  //               ),
  //             ),
  //             child: AnimatedOpacity(
  //               duration: const Duration(seconds: 1),
  //               opacity: opacity,
  //               child: Lottie.asset('assets/lottie/anim.json'),
  //             ),
  //           ),
            
  //                Padding(
  //           padding: const EdgeInsets.only(left: 210),
  //           child: GestureDetector(
  //              onTapDown: (TapDownDetails details) {
                
  //           BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(k.length,_isClicked));
            
  //            int dynamicindex=  nextNumber(index:k.length);
  //           // nextNumber({required index})=>Random().nextInt(index);
  //  Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => BlocProvider(
  //           create: (context) => BlocEstekhare(),
  //           child: DetailsGhazaliatHafezScreen(
  //              index: k[dynamicindex].id,
  //              GhazaliatModel:k[dynamicindex],
            
  //           ),
  //     ),
  //   ));
  //           //  setState(() {
  //           //                      _isClicked = !_isClicked;
  //           //                     // _tapPosition = details.globalPosition;
  //           //               });
  //              },
  //             child: Container(
  //                 width: 35,
  //                 color: _isClicked?Colors.blue:const Color.fromARGB(255, 115, 107, 82),
  //               // Third container properties
  //             ),
  //           ),
  //     ),
  //           ] ) );
  //             }
  //             return Container();
  //           },),
  
            BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
  
              if(state is LoadingEstekhareState){
                return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
              } 
            //   else if(state is ClickedEstekhareState){
            //        return 
            //         GestureDetector(
            //     onTap: () {
            //       // ارسال رویداد کلیک به بلاک
            //       BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(state.Cliiiiccccc));
            //     },
            //    child: Container(
            //     width: 30,
            //     color: state.Cliiiiccccc?Colors.blue:Colors.amber,
            //   // Third container properties
            //   // ...
            // ),
            //   );
            //   }
       else  if(state is SuccesEstekhareState){
      int nextNumber({required int index}) {
    int clickCount = 0; // تعداد کلیک‌ها را حساب می‌کند
    bool isLimitReached = false; // برای اطمینان از رسیدن به حداکثر تعداد کلیک‌ها
    // تعداد مجاز تولید اعداد تصادفی
     int limit=500;
    if (!isLimitReached) { // تنها اگر به حداکثر تعداد کلیک‌ها نرسیده باشیم
      clickCount++; // تعداد کلیک‌ها را افزایش می‌دهیم
      if (clickCount >= limit) { // اگر تعداد کلیک‌ها بیشتر یا مساوی حداکثر مجاز باشد
        isLimitReached = true; // وضعیت رسیدن به حداکثر تعداد کلیک‌ها را به true تغییر می‌دهیم
        print('You have reached the maximum number of clicks.'); // اطلاع رسانی به کاربر
      } else {
        int randomNumber = Random().nextInt(limit); // تولید عدد تصادفی
        print('Random Number: $randomNumber');
        return randomNumber;
      }
    }
    return 1; // یا مقدار خاصی که مد نظر شما باشد
  }
                List<GhazalItemModelEntity> model = state.ghazaliatHafezEstekhare;
          // int dynamicindex=  nextNumber(index:model.length);
         
          
  //                if(state is ClickedState){
  //                  return GestureDetector(
  //                   onTap: () {
  //            BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(clic:_isClicked,
  //            id: Random().nextInt(k.length)));

  // Navigator.of(context).push(MaterialPageRoute(
  //   builder: (context) => BlocProvider(
  //     create: (context) => BlocEstekhare(),
  //     child: DetailsGhazaliatHafezScreen(
  //        index: k[dynamicindex].id,
  //        GhazaliatModel: k[dynamicindex],
      
  //     ),
      
  //   ),
  // ));
  //                   },
  //                    child: Container(
  //                      width: 30,
  //                      height: 900,
  //                      color: Colors.amber,
                      
  //                    ),
  //                  );
  //                 }
     return 
    // bool isClicked = false; // متغیری برای نگهداری وضعیت کلیک

GestureDetector(
  onTapDown: (TapDownDetails details) {
                      setState(() {
          _isClicked = true;
          _tapPosition = details.globalPosition;
        });
            //             setState(() {
            //    _colorContainer = _colorContainer == Colors.red ? 
            //          Colors.transparent : 
            //          Colors.red;
            //  });
    //BlocProvider.of<BlocEstekhare>(context).add(ChangeTab());

     BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(
  nextNumber(index: state.ghazaliatHafezEstekhare[indext].id!)));
    Navigator.of(context).push(MaterialPageRoute(
  builder: (context) => BlocProvider.value(
    value: BlocProvider.of<BlocEstekhare>(context),
    child: DetailsGhazaliatHafezScreen(
      index:  state.ghazaliatHafezEstekhare[indext].id,
      GhazaliatModel: state.ghazaliatHafezEstekhare[indext],
    // GhazaliatModel: model[].id,
    ),
  ),
));
    // اضافه کردن کدهای دیگر که می‌خواهید در زمان کلیک انجام دهید
  },
  child: Stack(
    children: [
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Goldfinger.jpg'),
            
          ),
        ),
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: opacity,
          child: Lottie.asset('assets/lottie/anim.json'),
        ),
      ),
        //  Ink(
        //     child: InkWell(
        //     child: Container(
        //     width: 200,
        //     height: 200,
        //     color: _colorContainer ,
        //   ),
        //   onTap: () {
        //     setState(() {
        //       _colorContainer = _colorContainer == Colors.red ? 
        //             Colors.transparent : 
        //             Colors.red;
        //     });
        //   },
        // )),
         if (_isClicked && _tapPosition != null)
        Positioned(
          left: _tapPosition!.dx - 1,
          top: 0,
          right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
          bottom: 0,
          child: Container(
            width: 10,
           // height: 10,
            color:_isClicked? const Color.fromARGB(255, 243, 4, 4):Colors.blue,
          ),
        ),
    ],
  ),


//      Stack(
//   children: [
//     GestureDetector(
//       onTapDown: (TapDownDetails details){
//          setState(() {
//       _isClicked = true; // تنظیم وضعیت کلیک به true
       
//     });
//            print("شتلییزر");
//        //  int randomNumber = generateRandomNumber();
//  BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(
//   nextNumber(index: state.ghazaliatHafezEstekhare[indext].id!)));
//     Navigator.of(context).push(MaterialPageRoute(
//   builder: (context) => BlocProvider.value(
//     value: BlocProvider.of<BlocEstekhare>(context),
//     child: DetailsGhazaliatHafezScreen(
//       index:  state.ghazaliatHafezEstekhare[indext].id,
//       GhazaliatModel: state.ghazaliatHafezEstekhare[indext],
//     // GhazaliatModel: model[].id,
//     ),
    
//   ),
// ));

// // سپس شیء bloc را به `DetailsGhazaliatHafezScreen` منتقل می‌کنیم و همچنین از شماره تصادفی استفاده می‌کنیم
// // Navigator.of(context).push(MaterialPageRoute(
// //   builder: (context) => BlocProvider(
// //     create: (context) => BlocEstekhare(),
// //     child: DetailsGhazaliatHafezScreen(
// //       index: randomNumber,
// //       GhazaliatModel: model[randomNumber],
// //       //GhazaliatModel: model[5],
// //     ),
// //   ),
// // ));
// // Navigator.of(context).push(MaterialPageRoute(
// //   builder: (context) => DetailsGhazaliatHafezScreen(
// //      //GhazaliatModel: model[randomNumber],
// //      index: randomNumber
// //     ),));

// //          print("dynamicIndexxxx::$randomNumber");
// //      BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(widget.e!.id!));

//       },
//       child: Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/Goldfinger.jpg'),
//           ),
//         ),
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 1),
//           opacity: opacity,
//           child: Lottie.asset('assets/lottie/anim.json'),
//         ),
//       ),
     
//     ),




// GestureDetector(
//     child:  Stack(
//     children: [
//       Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/Goldfinger.jpg'),
//           ),
//         ),
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 1),
//           opacity: opacity,
//           child: Lottie.asset('assets/lottie/anim.json'),
//         ),
//       ),
//       // if (_isClicked && _tapPosition != null)
//       //   Positioned(
//       //     left: _tapPosition!.dx - 1,
//       //     top: 0,
//       //     right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//       //     bottom: 0,
//       //     child: Container(
//       //       width: 2,
//       //       height: 10,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//     ],
//   ),
//   //                  onTapDown: (TapDownDetails details) {
//   //                   // setState(() {
//   //                   //        _isClicked = !_isClicked;
//   //                   //        _tapPosition = details.globalPosition;
//   //                   // });

//   // //BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(k.length,true,Offset.zero));
    
   


//   // print("WEsteWee");
  
//   //                  }
//   ),
   















    // Positioned(
    //   top: 0,
    //   left: 0,
    //   child: GestureDetector(
    //     onTap: () {
    //       setState(() {
    //         _isClicked = !_isClicked;
    //       });
    //       print("شتلییزر");
    //       BlocProvider.of<AppBlocss>(context).add(ChangeTabgg());
    //       Navigator.of(context).push(MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //           create: (context) => BlocEstekhare(),
    //           child: DetailsGhazaliatHafezScreen(
    //             index: k[dynamicindex].id,
    //             GhazaliatModel: k[dynamicindex],
    //           ),
    //         ),
    //       ));
    //     },
    //     child: Container(
    //       width: 30,
    //       height: 400,
    //       color: _isClicked ? Colors.amber : Colors.red,
    //     ),
    //   ),
    // ),
// BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
//   return GestureDetector(
//     onTap: () {
//        Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => BlocProvider(
//               create: (context) => BlocEstekhare(),
//               child: DetailsGhazaliatHafezScreen(
//                 index: k[dynamicindex].id,
//                 GhazaliatModel: k[dynamicindex],
//               ),
//             ),
//           ));
//     },
//     child: Container(
//       width: 50,
//       color: Colors.green,
//     ),
//   );
// },),

// BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
//   return GestureDetector(
//     onTap: () {
//        Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => BlocProvider(
//               create: (context) => BlocEstekhare(),
//               child: DetailsGhazaliatHafezScreen(
//                 index: k[Random().nextInt(k.length)].id,
//                 GhazaliatModel: k[Random().nextInt(k.length)],
//               ),
//             ),
//           ));
//     },
//     child: Center(
//       child: Container(
//         width: 50,
//         color: Color.fromARGB(255, 19, 89, 202),
//       ),
//     ),
//   );
// },),

// BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
//   return GestureDetector(
//     onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => BlocProvider(
//               create: (context) => BlocEstekhare(),
//               child: DetailsGhazaliatHafezScreen(
//                 index: k[Random().nextInt(k.length)].id,
//                 GhazaliatModel: k[nextRd],
//               ),
//             ),
//           ));
//       // Navigator.of(context).push(MaterialPageRoute(
//       //         builder: (context) => BlocProvider.value(
//       //           value: BlocProvider.of<AppBlocss>(context), // از بلاک جاری استفاده می‌کنیم
//       //           child: DetailsGhazaliatHafezScreen(
//       //             index: k[nextRd].id,
//       //             GhazaliatModel: k[nextRd],
//       //           ),
//       //         ),
//       //       ));
//     },
//     child: Padding(
//       padding: const EdgeInsets.only(left: 80),
//       child: Container(
//         width: 50,
//         color: Color.fromARGB(255, 159, 182, 219),
//       ),
//     ),
//   );
// },),
  
);
       
  
              

                ///////////////////////////درست 
  // GestureDetector(
  //   child:  Stack(
  //   children: [
  //     Container(
  //       height: double.infinity,
  //       decoration: const BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.fill,
  //           image: AssetImage('assets/images/Goldfinger.jpg'),
  //         ),
  //       ),
  //       child: AnimatedOpacity(
  //         duration: const Duration(seconds: 1),
  //         opacity: opacity,
  //         child: Lottie.asset('assets/lottie/anim.json'),
  //       ),
  //     ),
  //     if (_isClicked && _tapPosition != null)
  //       Positioned(
  //         left: _tapPosition!.dx - 1,
  //         top: 0,
  //         right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
  //         bottom: 0,
  //         child: Container(
  //           width: 2,
  //           height: 10,
  //           color: Colors.black,
  //         ),
  //       ),
  //   ],
  // ),
  //                  onTapDown: (TapDownDetails details) {
  //                   setState(() {
  //                          _isClicked = !_isClicked;
  //                          _tapPosition = details.globalPosition;
  //                   });

  // //BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(k.length,true,Offset.zero));
  //       int dynamicindex=  nextNumber(index:k.length,);
   

  // Navigator.of(context).push(MaterialPageRoute(
  //   builder: (context) => BlocProvider(
  //     create: (context) => BlocEstekhare(),
  //     child: DetailsGhazaliatHafezScreen(
  //        index: k[dynamicindex].id,
  //        GhazaliatModel: k[dynamicindex],
      
  //     ),
      
  //   ),
  // ));

  // print("WEsteWee");
  
  //                  }
  // );
   


   //////////////////////////////////////درست
  
   
//  Stack(
//   children: [
//     Container(
//       height: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.fill,
//           image: AssetImage('assets/images/Goldfinger.jpg'),
//         ),
//       ),
//       child: AnimatedOpacity(
//         duration: const Duration(seconds: 1),
//         opacity: opacity,
//         child: Lottie.asset('assets/lottie/anim.json'),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 160),
//       child: Container(
//         color: Colors.amber,

//         width: 50,
//         // Second container properties
//         // ...
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 110),
//       child: Container(

//           width: 50,
//           color: Colors.red,
//         // Third container properties
//         // ...
//       ),
//     ),
//      Padding(
//       padding: const EdgeInsets.only(left: 210),
//       child: GestureDetector(
//          onTapDown: (TapDownDetails details) {
//        setState(() {
//                            _isClicked = !_isClicked;
//                            _tapPosition = details.globalPosition;
//                     });
//          },
//         child: Container(
               
//             width: 50,
//             color: const Color.fromARGB(255, 179, 115, 110),
//           // Third container properties
//           // ...
//         ),
//       ),
//     ),
//     //    Padding(
//     //   padding: const EdgeInsets.only(left: 260),
//     //   child: GestureDetector(
//     //     onTapDown: (TapDownDetails details) {
//     //      print("سبز");
//     //  //BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(details.globalPosition));

//     //     },
//     //     child: 
//     //    Container(
//     //         width: 50,
//     //         color: Color.fromARGB(255, 7, 149, 3),
               
//     //       // Third container properties
//     //       // ...
//     //     ),
//     //   ),
//     // ),
     
//     Padding(
//   padding: const EdgeInsets.only(left: 210),
//   child: GestureDetector(
//     onTapDown: (TapDownDetails details) {
//       _tapPosition = details.globalPosition;
//       BlocProvider.of<BlocEstekhare>(context).add(ClickedEvent(k.length,
//       _isClicked,_tapPosition=details.globalPosition));
//       // Consider using setState here if necessary
//     },
//     child: Stack(
//       children: [
//         Container(
//           width: 50,
//           color: const Color.fromARGB(255, 179, 115, 110),
//            child: Center(
//              child: Positioned(
//               left:_tapPosition?.dx ?? 0 ,
//               top: 0,
//             right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//           bottom: 0,
//                child: Container(
//                 color: _isClicked?Colors.orange:Colors.blue,
//              width: 2,
                             
                    
//                ),
//              ),
//            ),
//         ),
// //         // Positioned(
// //         //   left: _tapPosition?.dx ?? 0,
// //         //   top: 0,
// //         //   child: Container(
// //         //     width: 2,
// //         //     height: 10,
// //         //     color: Colors.black,
// //         //   ),
// //         // ),
// //       ],
// //     ),
// //   ),
// // ),

//   //  if (state is ClickedEstekhareState)
//   //    Positioned(
//   //         left: _tapPosition!.dx - 1,
//   //         top: 0,
//   //         right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//   //         bottom: 0,
//   //         child: Container(
//   //           width: 2,
//   //           height: 10,
//   //           color: Colors.black,
//   //         ),
//   //       ),
      
//   ],
// //),


  // child: Stack(
  //   children: [
  //     Container(
  //       height: double.infinity,
  //       decoration: const BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.fill,
  //           image: AssetImage('assets/images/Goldfinger.jpg'),
  //         ),
  //       ),
  //       child: AnimatedOpacity(
  //         duration: const Duration(seconds: 1),
  //         opacity: opacity,
  //         child: Lottie.asset('assets/lottie/anim.json'),
  //       ),
  //     ),

  //     if (_isClicked && _tapPosition != null)
  //       Positioned(
  //         left: _tapPosition!.dx - 1,
  //         top: 0,
  //         right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
  //         bottom: 0,
  //         child: Container(
  //           width: 2,
  //           height: 10,
  //           color: Colors.black,
  //         ),
  //       ),
  //   ],
  // ),
// //  child: ListView(

// //       shrinkWrap: true,
     
// //        children: [
// //         Center(child: GestureDetector(onTap: (){
             
// //            Navigator.of(context).push(MaterialPageRoute(
// //     builder: (context) => BlocProvider(
// //       create: (context) => BlocEstekhare(),
// //       child: DetailsGhazaliatHafezScreen(
// //         index: k[indext].id,
// //       GhazaliatModel: k[indext],

// //        // e: k[element],
// //         //e: k[adjustedIndex],
// //       ),
// //     ),
// //   ));
              
// //         },child: Container(height: 60,width: 60,color: Colors.amber,),),),
// //        ],
// //       ),
// );

              }
              
               
              
            
              
            

//         else if(state is SuccesEstekhareStateTow){
//        List<GhazalItemModelEntity> k = state.ghazaliatHafezEstekhare;
//             return 
//  GestureDetector(
//     child:  Stack(
//     children: [
//       Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/Goldfinger.jpg'),
//           ),
//         ),
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 1),
//           opacity: opacity,
//           child: Lottie.asset('assets/lottie/anim.json'),
//         ),
//       ),
      
//            Padding(
//       padding: const EdgeInsets.only(left: 210),
//       child: GestureDetector(
//          onTapDown: (TapDownDetails details) {
              
//      // BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(k.length,_isClicked));
      
//        int dynamicindex=  nextNumber(index:k.length);
//       // nextNumber({required index})=>Random().nextInt(index);
//  Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => BlocProvider(
//       create: (context) => BlocEstekhare(),
//       child: DetailsGhazaliatHafezScreen(
//          index: k[dynamicindex].id,
//          GhazaliatModel:k[dynamicindex],
      
//       ),
//     ),
//   ));
//       //  setState(() {
//       //                      _isClicked = !_isClicked;
//       //                     // _tapPosition = details.globalPosition;
//       //               });
//          },
//         child: Container(
//             width: 10,
//             color: _isClicked?const Color.fromARGB(255, 158, 196, 227):const Color.fromARGB(255, 215, 198, 149),
//           // Third container properties
//           // ...
//         ),
//       ),
//     ),
//       ] ) );
   
//           }
              // else if(state is clickedEstekhareState){
              //   return Container(
              //     height: 10,width: 10,color: Colors.amber,);

              // }
              // else if(state is ErrorEstekhareState ){
              //    return Center(
              //       child: Text(state.errorText));
              // }
              
     return Container();
              
             // return Center(child: Container(height: 50,width: 50,color: Colors.amber,));

            },
            ),

          
          
      
      //  body: GestureDetector(
      //  onTapDown: (TapDownDetails details) {
      //   setState(() {
      //     _isClicked = !_isClicked;
      //     _tapPosition = details.globalPosition;
      //   });
      //  },
      //  child: Stack(
      //   children: [
      //     Container(
      //       height: double.infinity,
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           fit: BoxFit.fill,
      //           image: AssetImage('assets/images/Goldfinger.jpg'),
      //         ),
      //       ),
      //       child: AnimatedOpacity(
      //         duration: const Duration(seconds: 1),
      //         opacity: opacity,
      //         child: Lottie.asset('assets/lottie/anim.json'),
      //        ),
      //     ),
      //     if (_isClicked && _tapPosition != null)
      //       Positioned(
      //         left: _tapPosition!.dx - 1,
      //         top: 0,
      //         right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
      //         bottom: 0,
      //         child: Container(
      //           width: 2,
      //           height: 10,
      //           color: Colors.black,
      //         ),
      //       ),
      //   ],
      //  ),
      //   ),
     ),
   );
  }
  // nextNumber({required index})=>Random().nextInt();
 
}

  // nextNumber({required index})=>Random().nextInt(index);
  // nextR({required index})=>Random().nextInt(index);
  // nextU({required index})=>Random().nextInt(index);





