
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share_plus/share_plus.dart';
class GhazaliatHafezScreen extends StatefulWidget {
  const GhazaliatHafezScreen({super.key});
  @override
  State<GhazaliatHafezScreen> createState() => _GhazaliatHafezScreenState();
}
class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
  ScrollController scrollController = ScrollController();
    //List<bool> isHeartSelectedList = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      BlocProvider.of<GhazaliatHafezBloc>(context).add(LoadMoreEvent());
  }});}
  @override
  Widget build(BuildContext context) {
    bool isHeartSelected =false;
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
                 int adjustedIndex = index < 17 ? index+1  : index+1 ;
                                Navigator.of(context).push(MaterialPageRoute(  
                                  builder: (context) => BlocProvider(
                                    create: (context) => GhazaliatHafezBloc(),
                                    child: DetailsGhazaliatHafezScreen(
                                      e: k[index],
                                      index:adjustedIndex,
                                    ),
                                  ),
                                ));
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
                   GestureDetector(
                    onTap: () {
                      
                      setState(() {
                      // isHeartSelected=!isHeartSelected;
      isHeartSelectedList[index] = !isHeartSelectedList[index];
                      },);
        // BlocProvider.of<GhazaliatHafezBloc>(context).add(ToggleHeartEvent(index));
                      },
                    child:  
                    Image.asset(
          isHeartSelectedList[index]? "assets/icons/selected_heart.png"
              : "assets/icons/unselected_heart.png",
        ),
//                     Image.asset(
// isHeartSelectedList[index] ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",)
)


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
                   Text("الی یا ابها",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: MyDimensions.light+2),),
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
