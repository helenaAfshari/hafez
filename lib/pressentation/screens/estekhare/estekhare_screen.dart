
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
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';


class EstekhareScreen extends StatefulWidget {
   GhazalItemModelEntity? e ;
  // int? index ;
  @override
  _EstekhareScreenState createState() => _EstekhareScreenState();
}
class _EstekhareScreenState extends State<EstekhareScreen> {
  final GlobalKey<ScaffoldState> _estekhareKey = GlobalKey();
   int indexxxxx=0;
   int indext =0;
int aaaa= 50;
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        opacity = 0;
      });
    });
  }
  double opacity = 1.0;
  bool _isClicked = false;
  Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
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
        body:BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
          if(state is LoadingEstekhareState){
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
          }else if(state is SuccesEstekhareState){
            List<GhazalItemModelEntity> k = state.ghazaliatHafezEstekhare;
            return 
  GestureDetector(
                   onTapDown: (TapDownDetails details) {
                    setState(() {
                           _isClicked = !_isClicked;
                           _tapPosition = details.globalPosition;
                    });
            // final list = List.generate(k.length, (index) {
            //   return nextNumber(min:0, max:k[index]);
            // });
        int dynamicindex=  nextNumber(index:k.length,);
   
//             for (var i = 0; i <= list.length; i++) {
//   var element = list[i];
//   print("jjkkkliuommn::::::$element");
//   // در این قسمت می‌توانید هر چیزی که باید در هر ایتریشن انجام شود را انجام دهید
  //int adjustedIndex = element < 17 ? element + 1 : element + 1;
    int adjustedIndex = indexxxxx < 17 ? indexxxxx+1  : indexxxxx+1;
                                // Navigator.of(context).push(MaterialPageRoute(  
                                //   builder: (context) => BlocProvider(
                                //     create: (context) => BlocEstekhare(),
                                //     child: DetailsGhazaliatHafezScreen(
                                //       GhazaliatModel: k[5-1],
                                //       index:5,
                                //     ),
                                //   ),
                                // )); 
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => BlocEstekhare(),
      child: DetailsGhazaliatHafezScreen(
        //index: element,
          //GhazaliatModel:k[indexx],
         index: k[dynamicindex].id,
         GhazaliatModel: k[dynamicindex],
        // GhazaliatModel: k[element], // اگر بخواهید از عناصر list استفاده کنید
        // e: k[element],
        // e: k[adjustedIndex],
      ),
      
    ),
  ));
  print("WEsteWee");

//int
// list.asMap().forEach((i, element) {
//    //int adjustedIndex = element < 17 ? element + 1 : element + 1;
//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => BlocProvider(
//       create: (context) => BlocEstekhare(),
//       child: DetailsGhazaliatHafezScreen(
//         index: 2,
//       GhazaliatModel: k[2-1],

//        // e: k[element],
//         //e: k[adjustedIndex],
//       ),
//     ),
//   ));
//   print("WEsteWee");
// });
// int adjustedIndex = index < 17 ? index+1  : index+1;
//                                 Navigator.of(context).push(MaterialPageRoute(  
//                                   builder: (context) => BlocProvider(
//                                     create: (context) => GhazaliatHafezBloc(),
//                                     child: DetailsGhazaliatHafezScreen(
//                                       e: k[index],
//                                       index:adjustedIndex,
//                                     ),
//                                   ),
//                                 ));
// int adjustedIndex = 0 < 17 ? 0 + 1 : 0;
// Navigator.of(context).push(MaterialPageRoute(  
//   builder: (context) => BlocProvider(
//     create: (context) => GhazaliatHafezBloc(),
//     child: DetailsGhazaliatHafezScreen(
//       e: k[adjustedIndex], // استفاده از adjustedIndex برای شاخص در لیست k
//       index: adjustedIndex,
//     ),
//   ),
// ));


//  final list = List.generate(k.length, (index) => nextNumber(min: 0, max: 20));
//  int adjustedIndex = index < 17 ? index+1  : index+1;
// list.forEach((element) {
//   int index = list.indexOf(element);
//   Navigator.of(context).push(MaterialPageRoute(  
//     builder: (context) => BlocProvider(
//       create: (context) => BlocEstekhare(),
//       child: DetailsGhazaliatHafezScreen(
//         index: element,
//        e:k[adjustedIndex],
//       ),
//     ),
//   ));
//   print("WEsteWee$index");
// });


///محاسبه ذرست
                //     final list = List.generate(10, (index) => nextNumber(min: 5, max: 10));
                //  // int adjustedIndex = index < 17 ? index+1  : index+1;
                //                 Navigator.of(context).push(MaterialPageRoute(  
                //                   builder: (context) => BlocProvider(
                //                     create: (context) => BlocEstekhare(),
                //                     child: DetailsGhazaliatHafezScreen(
                //                       GhazaliatModel: k[2-1],
                //                       index:2,
                //                     ),
                //                   ),
                //                )); 




                // print("lllliooopppjj");
  // onTapDown: (TapDownDetails details) {
  //   setState(() {
  //     _isClicked = !_isClicked;
  //     _tapPosition = details.globalPosition;
  //   });
  //   // Navigate to detailsScreen
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => DetailsGhazaliatHafezScreen()),
  //   );
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
          opacity: opacity,
          child: Lottie.asset('assets/lottie/anim.json'),
        ),
      ),
      if (_isClicked && _tapPosition != null)
        Positioned(
          left: _tapPosition!.dx - 1,
          top: 0,
          right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
          bottom: 0,
          child: Container(
            width: 2,
            height: 10,
            color: Colors.black,
          ),
        ),
    ],
  ),
//  child: ListView(

//       shrinkWrap: true,
     
//        children: [
//         Center(child: GestureDetector(onTap: (){
         
//            Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => BlocProvider(
//       create: (context) => BlocEstekhare(),
//       child: DetailsGhazaliatHafezScreen(
//         index: k[indext].id,
//       GhazaliatModel: k[indext],

//        // e: k[element],
//         //e: k[adjustedIndex],
//       ),
//     ),
//   ));
          
//         },child: Container(height: 60,width: 60,color: Colors.amber,),),),
//        ],
//       ),
);

            // Center(child: Container(height: 50,width: 50,color: Colors.amber,));
//          ListView.builder(
//           itemCount: state.ghazaliatHafezEstekhare.length,
//          scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//                return GestureDetector(
//                onTapDown: (TapDownDetails details) {
//                 //   int adjustedIndex = index < 17 ? index+1  : index+1;
//                 //                 Navigator.of(context).push(MaterialPageRoute(  
//                 //                   builder: (context) => BlocProvider(
//                 //                     create: (context) => BlocEstekhare(),
//                 //                     child: DetailsGhazaliatHafezScreen(
//                 //                       e: k[index],
//                 //                       index:adjustedIndex,
//                 //                     ),
//                 //                   ),
//                 //                )); 
//                 // print("lllliooopppjj");
// // int randomIndex = Random().nextInt(widget.e.id!);
// //         Navigator.of(context).push(MaterialPageRoute(
// //           builder: (context) => BlocProvider(
// //             create: (context) => BlocEstekhare(),
// //             child: DetailsGhazaliatHafezScreen(
// //               e: k[randomIndex],
// //               index: randomIndex,
// //             ),
// //           ),
// //         ));
// //         print("lllliooopppjj");

//  // int randomIndex = Random().nextInt(10); 
//  final randomIndex = nextNumber(min:0,max:50);
//     int adjustedIndex = index < 17 ? index+1  : index+1;
//    Navigator.of(context).push(MaterialPageRoute(  
//                                   builder: (context) => BlocProvider(
//                                     create: (context) => GhazaliatHafezBloc(),
//                                     child: DetailsGhazaliatHafezScreen(
//                                      e: k[index],
//                                       index:adjustedIndex,
//                                     ),
//                                   ),
//                                 ));
//                                 print("FFFDDDDSWWW::::$adjustedIndex");
//           // Navigator.push(
//           //      context,
//           //      MaterialPageRoute(
//           //        builder: (context) => DetailsGhazaliatHafezScreen(
//           //   e: k[index],
//           //   index: adjustedIndex,
//           //        ),
//           //      ),
//           //    );// Generates a random index from 0 to 140
//   // Navigator.of(context).push(MaterialPageRoute(
//   //   builder: (context) => BlocProvider(
//   //     create: (context) => BlocEstekhare(),
//   //     child: DetailsGhazaliatHafezScreen(
//   //       e: k[randomIndex],
//   //       index: randomIndex,
//   //     ),
//   //   ),
//   // ));
//      //      Navigator.push(
//         //        context,
//         //        MaterialPageRoute(
//         //          builder: (context) => DetailsGhazaliatHafezScreen(
//         //     e: k[10],
//         //     index: 10,
//         //          ),
//         //        ),
//         //      );


//   // Handle the case where widget.e or widget.e.id is null
//   print("Error: widget.e or widget.e.id is null.");
//                },
//                child: 
//                Center(
//                  child: SizedBox(
//                    height: MediaQuery.of(context).size.height,
//                    child: Container(
//                      width: double.infinity,
//                      decoration: const BoxDecoration(
//                              image: DecorationImage(
//                                fit: BoxFit.fill,
//                                image: AssetImage('assets/images/Goldfinger.jpg'),
//                              ),
//                      ),
//                    child:Text(state.ghazaliatHafezEstekhare[index].id.toString(),
//                     //  child: AnimatedOpacity(
//                     //          duration: const Duration(seconds: 1),
//                     //          opacity: opacity,
//                     //          child: Lottie.asset('assets/lottie/anim.json'),
//                     //  ),
//                    ),
//                    )
//                  ),
//                ),
//             //    // اگر _isClicked true و _tapPosition مقدار ندارد، یک خط عمودی به عکس اضافه می‌شود
//             //    if (_isClicked && _tapPosition != null)
//             //      Positioned(
//             // left: _tapPosition!.dx - 1,
//             // top: 0,
//             // right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//             // bottom: 0,
//             // child: Container(
//             //   width: 2,
//             //   height: 10,
//             //   color: Colors.black,
//             // ),
//             //      ),
          
//                );
//         //        GestureDetector(
//         //    onTapDown: (TapDownDetails details) {
           
//         //  //    int index = ((details.localPosition.dx / MediaQuery.of(context).size.width*125)).floor();
//         //  // index = index.clamp(0, 122);
//         //      //int index = (details.localPosition.dx / MediaQuery.of(context).size.width*123).floor();
//         //      Navigator.push(
//         //        context,
//         //        MaterialPageRoute(
//         //          builder: (context) => DetailsGhazaliatHafezScreen(
//         //     e: k[10],
//         //     index: 10,
//         //          ),
//         //        ),
//         //      );
//         //    },
//         //    child: Stack(
//         //      children: [
//         //        Container(
//         //          height: double.infinity,
//         //          decoration: const BoxDecoration(
//         //     image: DecorationImage(
//         //       fit: BoxFit.fill,
//         //       image: AssetImage('assets/images/Goldfinger.jpg'),
//         //     ),
//         //          ),
//         //          child: AnimatedOpacity(
//         //     duration: const Duration(seconds: 1),
//         //     opacity: opacity,
//         //     child: Lottie.asset('assets/lottie/anim.json'),
//         //          ),
//         //        ),
//         //        // اگر _isClicked true و _tapPosition مقدار ندارد، یک خط عمودی به عکس اضافه می‌شود
//         //        if (_isClicked && _tapPosition != null)
//         //          Positioned(
//         //     left: _tapPosition!.dx - 1,
//         //     top: 0,
//         //     right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//         //     bottom: 0,
//         //     child: Container(
//         //       width: 2,
//         //       height: 10,
//         //       color: Colors.black,
//         //     ),
//         //          ),
//         //      ],
//         //    ),
//         //  );
         
//           },
         
               
           
//          )
;
           

             
              //    GestureDetector(
              //     // onTapDown: (TapDownDetails details) {
              //     //   print("hhhhh");
              //     //      //  BlocProvider.of<BlocEstekhare>(context).add(EstekhareLoadedEvent(widget.index??0));


              //     // },
              //      onTapDown: (TapDownDetails details) {
              //  int adjustedIndex = index < 17 ? index+1  : index+1;
            
              //       Navigator.of(context).push(MaterialPageRoute(  
                      
              //                                 builder: (context) => BlocProvider(
              //                                   create: (context) => BlocEstekhare(),
              //                                   child: DetailsGhazaliatHafezScreen(
              //                                     e: k[index],
              //                                     index:adjustedIndex,
              //                                   ),
              //                                 ),
              //                               )); 
              //       // setState(() {
              //       //   _isClicked = !_isClicked;
              //       //   _tapPosition = details.globalPosition;
              //       // });
              //      },
              //      child: Stack(
              //       children: [
              //         Container(
              // height: double.infinity,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/Goldfinger.jpg'),
              //   ),
              // ),
              // child: AnimatedOpacity(
              //   duration: const Duration(seconds: 1),
              //   opacity: opacity,
              //   child: Lottie.asset('assets/lottie/anim.json'),
              //  ),
              //         ),
              //         if (_isClicked && _tapPosition != null)
              // Positioned(
              //   left: _tapPosition!.dx - 1,
              //   top: 0,
              //   right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
              //   bottom: 0,
              //   child: Container(
              //     width: 2,
              //     height: 10,
              //     color: Colors.black,
              //   ),
              // ),
              //       ],
              //      ),
              //       );
              
                    
            
          }else if(state is ErrorEstekhareState ){
             return Center(
                child: Text(state.errorText));
          }else{
     return Container();
          }
         // return Center(child: Container(height: 50,width: 50,color: Colors.amber,));

        },
        )
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
  
 
}

 nextNumber({required index})=>Random().nextInt(index);





