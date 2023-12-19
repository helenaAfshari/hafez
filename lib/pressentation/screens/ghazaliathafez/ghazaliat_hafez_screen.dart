
// ignore_for_file: dead_code

import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
// class GhazaliatHafezScreen extends StatelessWidget {
//   const GhazaliatHafezScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  BlocProvider<GhazaliatHafezBloc>(
//       create: (context) => GhazaliatHafezBloc(),
//       child: SafeArea(
//       child: Scaffold(
//         body:BlocBuilder<GhazaliatHafezBloc,GhazaliatHafezState>(
//         builder: (context, state) {
//           if(state is GhazaliatHafezInitialState|| state is GhazaliatHafezLoadingState){
//             return Center(
//               child:  CircularProgressIndicator(color: Colors.blue),
//             );
//           }
//           if(state is GhazaliatHafezSuccesState){
//             return Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              child: ListView.builder(
//               itemCount: state.ghazaliatHafez.length,
//               itemBuilder: (context, index) {
//                return Card(child: ListTile(
//                   title: Text(state.ghazaliatHafez[index].title??""),
                  
//                ),);
//              },),
//             );
          
//           }
//             if(state is GhazaliatHafezErrorState ){
//               return Center(
//                child: Text(state.errorText),
//               );
        
//             }
//             return Container();
//         },
//         ),
//       ),
//       ));
      
//   }
// }

class GhazaliatHafezScreen extends StatefulWidget {
  const GhazaliatHafezScreen({super.key});

  @override
  State<GhazaliatHafezScreen> createState() => _GhazaliatHafezScreenState();
}

class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
//  bool loadingMore = false;

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      BlocProvider.of<GhazaliatHafezBloc>(context).add(LoadMoreEvent());
  }
});

    
  }
  @override
  Widget build(BuildContext context) {
    bool isHeartSelected =false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
          builder: (context, state) {
             if (state is GhazaliatHafezEndOfListState) {
      // نمایش پیام یا انجام دیگر اقدامات
      return Center(
        child: Text(state.message),
      );
    }
            if (state is GhazaliatHafezLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            } else if (state is GhazaliatHafezSuccesState) {
              print("state.ghazaliatHafez ${state.ghazaliatHafez}");
              return
              SizedBox(
      height:
            UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
        width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        //const MyAppBar(),
        const Gap(35),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
           
                   return 
                Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MyColors.boxBottomColor,
                   border: Border.all(color: MyColors.borderBottomColor)
                  ),
                  margin: const EdgeInsets.only(left: 29.0,right: 29.0),
       height: UIUtils.getConvertedHeight(context,90),
       width: UIUtils.getConvertedWidth(context,292),
       child: Padding(
         padding:  EdgeInsets.only(right: MyDimensions.medium+2),
         child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               textDirection: TextDirection.rtl,
               children: [
                 //const Gap(10),
                 Padding(
               padding: const EdgeInsets.only(left: 5,top: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
          
          const Gap(3),
          StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                setState(() {
                isHeartSelected=!isHeartSelected;
                },);
              },
              child:  Image.asset(
          isHeartSelected ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",
            ));
          },),
                 ],
               ),
                 ),
                 Text(state.ghazaliatHafez[index].title,style: Theme.of(context)
                   .textTheme
                   .titleLarge!.copyWith(fontSize: 12),
                   ),
                 Text("الی یا ابها",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 10),),
                 const Gap(10),
                CustomDivider(indent: 10,endIndent: 10,),
               ],
             ),
       ),
    
                );
                     
              },
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: state.ghazaliatHafez.length),
            ),
          
          const Gap(30),
         // const MyBottomNavigation(),
        ],
      ),
        );
            //      Expanded(
            //   child: ListView.separated(
            //     physics: const ScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return 
            //       Container();
            //     },
            //     separatorBuilder: (context, index) => const Gap(5),
            //     itemCount: 1,
            //   ),
            // );
        //          SizedBox(
        //           height: UIUtils.getConvertedHeight(context,550),
        //  width: UIUtils.getConvertedWidth(context,226),
        //            child: ListView.builder(
        //                itemCount: state.ghazaliatHafez.length,
        //                itemBuilder: (context, index) {
        //                  return Container(
        //                     margin: const EdgeInsets.only(left: 67.0,right: 67.0),
        //                   height: 50,
        //                   width: 50,
        //                   color: Colors.amber,
        //                  );
        //                  // return Card(
        //                  //   // child: ListTile(
        //                  //   //   title: Text(state.ghazaliatHafez[index].title),
        //                  //   // ),
        //                  //   child: Container(
        //                  //     color: Colors.amber,
                        
        //                  //   ),
        //                  // );
        //                },
        //              ),
        //          );
            } 
    //         else if (state is GhazaliatHafezToggleState) {
    //           isHeartSelected = state.isHeartSelected;
      
    // }
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



//////////////////////////
//درسته
// class GhazaliatHafezScreen extends StatelessWidget {
//   const GhazaliatHafezScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//           floatingActionButton: FloatingActionButton(onPressed: (){
//             context.read<GhazaliatHafezBloc>().add(LoadedEvent());
//           }),
//           body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
//             builder: (context, state) {
//               if (state is GhazaliatHafezLoadingState ) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Colors.blue),
//                 );
//               } else if (state is GhazaliatHafezSuccesState) {
//                 print("state.ghazaliatHafez ${state.ghazaliatHafez}");
//                 return ListView.builder(
//                     itemCount: state.ghazaliatHafez.length,
//                     itemBuilder: (context, index) {
//                     //GhazaliatHafez ghazalItem = state.ghazaliatHafez[index];
//                       return Card(
//                         child: ListTile(
//                           title: Text(
//                            state.ghazaliatHafez[index].title),
//                         ),
//                       );
//                     },
//                   )
//                 ;
//               } else if (state is GhazaliatHafezErrorState) {
//                 return Center(
//                   child: Text(state.errorText),
//                 );
//               } else {
//                 // در صورتی که حالت دیگری وجود دارد

//                 print('cannot detect state');
//                 return Container();
//               }
//             },
//           ),
//         )
//       ;
//   }
// }

// ////////////////////////////
// ///
// class GhazaliatHafezScreen extends StatefulWidget {
//   const GhazaliatHafezScreen({Key? key}) : super(key: key);

//   @override
//   _GhazaliatHafezScreenState createState() => _GhazaliatHafezScreenState();
// }

// class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
//   late GhazaliatHafezBloc _ghazaliatHafezBloc;

//   @override
//   void initState() {
//     super.initState();
//     _ghazaliatHafezBloc = GhazaliatHafezBloc();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _ghazaliatHafezBloc,
//       child: SafeArea(
//         child: Scaffold(
//           body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
//             builder: (context, state) {
//               if (state is GhazaliatHafezInitialState) {
//                    _ghazaliatHafezBloc.add(LoadedEvent());
//                 return const Center(
//                   child: CircularProgressIndicator(color: Colors.blue),
//                 );
//               } else if (state is GhazaliatHafezSuccesState) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: state.ghazaliatHafez?.length,
//                     itemBuilder: (context, index) {
//                       // return Card(
//                       //   child: ListTile(
//                       //     title: Text(state.ghazaliatHafez![index].ghazaliatHafezToList[1].title!),
//                       //   ),
//                       // );
//                       return Card(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       for (int i = 0; i < state.ghazaliatHafez![index].ghazaliatHafezToList.length; i++)
// Text(state.ghazaliatHafez![index].ghazaliatHafezToList[i].title ?? 'مقدار موجود نیست'),
//     ],
//   ),
// );
//                     },
//                   ),
//                 );
//               } else if (state is GhazaliatHafezErrorState) {
//                 return Center(
//                   child: Text(state.errorText),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _ghazaliatHafezBloc.close();
//     super.dispose();
//   }
// }




// class GhazaliatHafezScreen extends StatefulWidget {
//   @override
//   _GhazaliatHafezScreenState createState() => _GhazaliatHafezScreenState();
// }

// class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
//   late GhazaliatHafezBloc _ghazaliatHafezBloc;

//   @override
//   void initState() {
//     super.initState();
//     _ghazaliatHafezBloc = GhazaliatHafezBloc()..add(LoadedEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _ghazaliatHafezBloc,
//       child: SafeArea(
//         child: Scaffold(
//           body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
//             builder: (context, state) {
//               if (state is GhazaliatHafezInitialState) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Colors.blue),
//                 );
//               } else if (state is GhazaliatHafezSuccesState) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: state.ghazaliatHafez?.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           title: Text(state.ghazaliatHafez![index].ghazaliatHafezToList[0].title!),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               } else if (state is GhazaliatHafezErrorState) {
//                 return Center(
//                   child: Text(state.errorText),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _ghazaliatHafezBloc.close();
//     super.dispose();
//   }
// }
