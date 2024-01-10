
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/bloc_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/event_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/state_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_bloc.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
class GhazaliatHafezScreen extends StatefulWidget {
  const GhazaliatHafezScreen({super.key});
  @override
  State<GhazaliatHafezScreen> createState() => _GhazaliatHafezScreenState();
}
class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
  ScrollController scrollController = ScrollController();
    //List<bool> isHeartSelectedList = [];
  late BadgeBloc todoBloc;
 int inu =0;
  @override
  void initState() {
    // todoBloc = BadgeBloc(todoRepository: IconRepository());
   //todoBloc.add(BadgeLoadEvent([5]));
  //todoBloc = BlocProvider.of<BadgeBloc>(context);
   
    //  todoBloc.add(BadgeLoadEvent(5));
    //BlocProvider.of<BadgeBloc>(context).add(BadgeLoadEvent(5));
   // BlocProvider.of<BadgeBloc>(context).add(BadgeLoadEvent([10]));

      // todoBloc=BlocProvider.of<BadgeBloc>(context);
  //todoBloc.add(BadgeLoadEvent(5));
    // todoBloc.add(BadgeLoadEvent(5));
    super.initState();
    scrollController.addListener(() {
  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      BlocProvider.of<GhazaliatHafezBloc>(context).add(LoadMoreEvent());
       BlocProvider.of<BadgeBloc>(context).add(LoadMoreBadgeEvent());
  }});
        
  }

   @override
  void dispose() {
    super.dispose();
  }
  
    Box? _myBox;
  @override
  Widget build(BuildContext context) {
    //  int selectedIndex = 0;
    //  bool onColor = true;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
          builder: (context, state) {
    //             if(state is GhazaliatHafezToggleState){
    //                            GestureDetector(
    //                     onTap: () {
    //                   //     setState(() {
    //                   //     // isHeartSelected=!isHeartSelected;
    //                   //  isHeartSelectedList[index] = !isHeartSelectedList[index];
    //                   //     },);
    //      BlocProvider.of<GhazaliatHafezBloc>(context).add(ToggleHeartEvent(0));
    
    //                       },
    //                     child:  
    //                     Image.asset(
    //           state.isHeartSelected
    //               ? "assets/icons/selected_heart.png"
    //               : "assets/icons/unselected_heart.png",
    //         ),
    // //                     Image.asset(
    // // isHeartSelectedList[index] ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",)
    // );
    //             }
            if (state is GhazaliatHafezLoadingState  ) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            } else if (state is GhazaliatHafezSuccesState ) {
              List<GhazalItemModelEntity> k = state.ghazaliatHafez;
              return
              SizedBox(
             height:
            UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
        width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const MyAppBar(),
         Gap(MyDimensions.large+3),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
            List<bool> isHeartSelectedList = List.generate(state.ghazaliatHafez[index].id!, (index) => false);
               return 
                GestureDetector(
                  onTap: () {
                 int adjustedIndex = index < 17 ? index+1  : index+1;
                                Navigator.of(context).push(MaterialPageRoute(  
                                  builder: (context) => BlocProvider(
                                    create: (context) => GhazaliatHafezBloc(),
                                    child: DetailsGhazaliatHafezScreen(
                                      e: k[index],
                                      index:adjustedIndex,
                                    ),
                                  ),
                                ));
                                //  Navigator.of(context).push(MaterialPageRoute(  
                                //   builder: (context) => BlocProvider(
                                //     create: (_) =>todoBloc,
                                //     child: DetailsGhazaliatHafezScreen(
                                //       e: k[index],
                                //       index:adjustedIndex,
                                //     ),
                                //   ),
                                // ));
                                 //BlocProvider.of<BadgeBloc>(context).add(BadgeLoadEvent([index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyDimensions.small),
                    color: MyColors.boxBottomColor,
                     border: Border.all(color: MyColors.borderBottomColor)
                    ),
                    margin:EdgeInsets.only(left: MyDimensions.semiLarge+5,right: MyDimensions.semiLarge+5),
                       height: UIUtils.getConvertedHeight(context,90),
                       width: UIUtils.getConvertedWidth(context,292),
                       child: Padding(
                         padding:  EdgeInsets.only(right: MyDimensions.medium+2),
                         child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               textDirection: TextDirection.rtl,
                               children: [
                   Padding(
                               padding: EdgeInsets.only(left: MyDimensions.small+1,top:  MyDimensions.small+1),
                               child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                           Gap( MyDimensions.small),
                          StatefulBuilder(builder: (context, setState) {
                            return Row(
                              children: [
                  GestureDetector(
                    onTap: ()async {
                      print("shareeee::::::::::");
                      await Share.share(MyStrings.shareText);
                      },
                    child:  Image.asset(
                   "assets/icons/share.png"
                  )
                  ),
                  const Gap(10),
                  //یک blocBuilder میزارم 
     
    
// GestureDetector(
//   onTap: () {
//     print("jjj");
//     // BlocProvider.of<BadgeBloc>(context).add(BadgeLoadEvent([index]));
//   },
//   child: Row(
//     children: [
//     Icon(Icons.abc),

//       BlocBuilder<BadgeBloc, BadgeState>(
//         builder: (context, state) {
//           if (state is BadgeLoading) {
//             return const Center(
//               child: CircularProgressIndicator(color: Colors.blue),
//             );
//           } else if (state is BadgeLoadedState) {
//               return Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     print("gggggjjjllllrrrr::::");
//                     // Toggle the isLiked property in your BadgeBloc

//     BlocProvider.of<BadgeBloc>(context).add(ChangeColorButtomListClickedEvent(id: index));
//                   },
//                   child: Icon(
//                     Icons.account_box,
//                     color: state.fcharacters[index].isLiked ? Colors.red : Colors.black, // Change the color here
//                   ),
//                 ),
//               );
          
//           }
//           return Container(); // Return an empty container if no conditions are met
//         },
//       ),
//     ],
//   ),
// )




//                   GestureDetector(
//         onTap: () {
//           print("jjj");
//       BlocProvider.of<BadgeBloc>(context).add(BadgeLoadEvent([index]));
//         },
//         child: Container(
//           width: 50,
//           height: 50,
//           color: Colors.amber,
//          // color: state.ghazaliatHafez[index] ? Colors.amber : Colors.red,
//           // Use ghazaliatHafez[index] for specific data related to the icon
//           // For example: Text(state.ghazaliatHafez[index].title),
//         ),
//       ),
    BlocBuilder<BadgeBloc, BadgeState>(
  builder: (context, state) {
    if (state is BadgeLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.blue),
      );
    } else if (state is BadgeLoadedState) {
      return Center(
        child: GestureDetector(
          onTap: () {
            print("gggggjjjllllrrrr::::");
            BlocProvider.of<BadgeBloc>(context).add(ChangeColorButtomListClickedEvent(id: index));
          },
          child: Icon(
            state.fcharacters[index].isLiked ? Icons.account_box : Icons.add_link_rounded,
            color: state.fcharacters[index].isLiked ? Colors.red : Colors.black,
          ),
        ),
      );
    }
    return Container();
  },
),


    //   return Center(
    //   child:  GestureDetector(
    //     onTap: () {
    //       print("gggggjjjllllrrrr::::");
    // BlocProvider.of<BadgeBloc>(context).add(ChangeColorButtomListClickedEvent(id: index));
    //     },
    //     child: Icon(
    //         state.fcharacters[index].isLiked ? Icons.account_box : Icons.add_link_rounded,
    //         color: Colors.red,
    //       ),
    //   ),
    //   );
    //   return ListView.builder(
    //     itemCount:state.characters.length ,
    //     itemBuilder: (context, index) {
    //       final todo = state.characters[index];
    //   IconButton(
    //         onPressed: () {
    //           context.read<BadgeBloc>().add(
    //                 ChangeColorButtomListClickedEvent(id: todo.ids! ),
    //               );
    //         },
    //         icon: Icon(
    //           todo.isLiked ? Icons.account_box : Icons.add_link_rounded,
    //           color: Colors.red,
    //         ),
    //       );
    //   },);
    
    
     
    
//       // else if(state is ChangeColorListState){
//       //    return Center(
//       //   child: GestureDetector(
//       //     onTap: () {
//       //      BlocProvider.of<BadgeBloc>(context).add(ChangeColorButtomListClickedEvent(id: index));
    
//       //       print("jjj$index");
//       //     },
//       //     child: (index == state.isColor)? 
//       //     Image.asset("assets/icons/selected_heart.png"):
//       //     Image.asset("assets/icons/unselected_heart.png"),
//       //     // child: Container(
//       //     //   width: 50,
//       //     //   height: 50,
//       //     //   color: (index == state.isColor) ? Colors.amber : itemColor,
//       //     //   // Use ghazaliatHafez[index] for specific data related to the icon
//       //     //   // For example: Text(state.ghazaliatHafez[index].title),
//       //     // ),
//       //   ),
//       // );
    
     
    
//       // }
//       // else if(state is BadgeLoadedState){
//       //  Center(
//       //   child: GestureDetector(
//       //     onTap: () {
//       //      BlocProvider.of<BadgeBloc>(context).add(BadgeLoadedEvent(index,));
    
//       //       print("jjj$index");
//       //     },
//       //     child: (index == state.isColor)? 
//       //     Image.asset("assets/icons/selected_heart.png"):
//       //     Image.asset("assets/icons/unselected_heart.png"),
//       //     // child: Container(
//       //     //   width: 50,
//       //     //   height: 50,
//       //     //   color: (index == state.isColor) ? Colors.amber : itemColor,
//       //     //   // Use ghazaliatHafez[index] for specific data related to the icon
//       //     //   // For example: Text(state.ghazaliatHafez[index].title),
//       //     // ),
//       //   ),
//       // );
//       // }
    
//         else if(state is BadgeErrorState){
//         return Center(
//                   child: Text(state.error),
//                 );
//       }
//       return Container();
//       }, 
    
//      ),
    
    
    
    
    
        //           BlocBuilder<GhazaliatHafezBloc,GhazaliatHafezState>(
                
        //           builder: (context, state) {
                   
        //              if (state is GhazaliatHafezLoadingState  ) {
        //             return const Center(
        //              child: CircularProgressIndicator(color: Colors.blue),
        //       );
        //     }
        // if (state is GhazaliatHafezSuccesState) {
        //   return ListView.builder(
        //     itemCount: state.ghazaliatHafez.length,
        //     itemBuilder: (context, index) {
            
        //       final ghazalItem = state.ghazaliatHafez[index];
        //           // List<bool> toggleList = state.;
    
        //       return ListTile(
        //         title: Text('Item ${ghazalItem.id}'), // Adjust as per your model
        //         // leading: Icon(
        //         //   isToggled ? Icons.favorite : Icons.favorite_border,
        //         //   color: isToggled ? Colors.red : null,
        //         // ),
        //         onTap: () {
        //           // Dispatch the toggle event
        //           context.read<GhazaliatHafezBloc>().add(ToggleHeartEvent(index));
        //         },
        //       );
        //     },
        //   );
        // }
        //     if(state is GhazaliatHafezErrorState){
        //       Center(
        //         child: Text(state.errorText),
        //       );
        //     }
        //     return Container();
        //           },)
                  //  GestureDetector(
                  //   onTap: () {
                      
                  //     setState(() {
                  //     // isHeartSelected=!isHeartSelected;
                  //      isHeartSelectedList[index] = !isHeartSelectedList[index];
                   
                  //     },);
                  //         BlocProvider.of<GhazaliatHafezBloc>(context).add(ToggleHeartEvent(index));
                  //     },
                  //   child:  
                  //   Image.asset(
                  //          isHeartSelectedList[index]? "assets/icons/selected_heart.png"
                  //              : "assets/icons/unselected_heart.png",
                  //        ),
                  //  //                     Image.asset(
                  //  // isHeartSelectedList[index] ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",)
                  //  )
    
    
    ///////////////////////////////////////////////////////////////////////
    //                   GestureDetector(
    //                     onTap: () {
    //                   //     setState(() {
    //                   //     // isHeartSelected=!isHeartSelected;
    //                   //  isHeartSelectedList[index] = !isHeartSelectedList[index];
    //                   //     },);
    //      BlocProvider.of<GhazaliatHafezBloc>(context).add(ToggleHeartEvent(index));
    
    //                       },
    //                     child:  
    //                     Image.asset(
    //           state.
    //               ? "assets/icons/selected_heart.png"
    //               : "assets/icons/unselected_heart.png",
    //         ),
    // //                     Image.asset(
    // // isHeartSelectedList[index] ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",)
    // ),
                              ],
                            );
                          },),],),
                   ),
                   Text(state.ghazaliatHafez[index].title!,style: Theme.of(context)
                     .textTheme
                     .titleLarge!.copyWith(fontSize: MyDimensions.xLight),
                     ),
                   Text(state.ghazaliatHafez[index].firstStanza!,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: MyDimensions.light+2),),
                    Gap( MyDimensions.xLight-2),
                  Expanded(child: CustomDivider(indent: MyDimensions.light+2,endIndent: MyDimensions.light+2,)),
                               ],
                             ),),),
                );},
              separatorBuilder: (context, index) => Gap(MyDimensions.light+2),
              itemCount: state.ghazaliatHafez.length),
            ),
           Gap(MyDimensions.large-2),
           const MyBottomNavigation(),
        ], ),);} 
             else if (state is GhazaliatHafezErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            } else {
              print('cannot detect state');
              return Container();
            }
          
          },
        ),
      ),
    );

  }

//   Color _getButtonColor(BadgeState state, int index,bool isClicked) {
//   print("Current state: $state");
  

//      return  (isClicked) ? Color.fromARGB(255, 13, 15, 16) : const Color.fromARGB(255, 161, 156, 139);
     
    
  
// }
}


//درست
// BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
//   builder: (context, state) {
//     if (state is GhazaliatHafezToggleState) {
//       return GestureDetector(
//         onTap: () {
//           BlocProvider.of<GhazaliatHafezBloc>(context).add(ToggleHeartEvent(0));
//         },
//         child: Image.asset(
//           state.isHeartSelected
//               ? "assets/icons/selected_heart.png"
//               : "assets/icons/unselected_heart.png",
//         ),
//       );
//     } else if (state is GhazaliatHafezLoadingState) {
//       // Handle loading state UI
//       return CircularProgressIndicator();
//     } else {
//       // Handle other states or provide a default UI
//       return YourDefaultWidget();
//     }
//   },
// )





//////////////////////
///
///// یک لیست برای ذخیره وضعیت انتخاب برای هر آیتم ایجاد کنید
// List<bool> isHeartSelectedList = List.generate(تعداد_آیتم‌ها, (index) => false);

// // ...

// // در GestureDetector برای انتخاب / عدم انتخاب آیکون قلب
// onTap: () {
//   setState(() {
//     // وضعیت انتخاب برای آیتم فعلی را تغییر دهید
//     isHeartSelectedList[index] = !isHeartSelectedList[index];
//   });
// },

// // ...

// // در ویجت Image.asset برای آیکون قلب
// Image.asset(
//   isHeartSelectedList[index] ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",
// ),

// // ...

// // در onTap برای ناوبری به جزئیات
// GestureDetector(
//   onTap: () {
//     int adjustedIndex = index < 17 ? index + 1 : index + 1;
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => BlocProvider(
//         create: (context) => GhazaliatHafezBloc(),
//         child: DetailsGhazaliatHafezScreen(
//           e: k[index],
//           index: adjustedIndex,
//           isHeartSelected: isHeartSelectedList[index], // وضعیت انتخاب را به صفحه جزئیات منتقل کنید
//         ),
//       ),
//     ));
//   },
// ),
