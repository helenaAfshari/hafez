
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailsGhazaliatHafezScreen extends StatelessWidget {
 final int? id ;
 final int? poemId ;
  String? titlee;
  static var title;

// GhazalItemModelEntity? model;

  DetailsGhazaliatHafezScreen({Key? key, this.id,this.poemId})
      : super(key: key) {
    

  }

  //    final List<String> texts = [
  //   'Text 1',
  //   'Text 1',
  //   'Text 1',
  //   'Text 1',
  //   'Text 1',
  //   'Text 1',
  // ];  
  final List<String> texts1 = [
    'اااااااااااااااااااااااااااااااااااااااااااااااااااافففففففففففففففففففففففففففففففففففففف',
  ];

  // List<GhazalItemModelEntity> k = [
  //   GhazalItemModelEntity(id: 1, title: "عنوان ۱"),
  //   GhazalItemModelEntity(id: 2, title: "عنوان ۲"),
  //   GhazalItemModelEntity(id: 3, title: "عنوان ۳"),
  // ];


  @override
  Widget build(BuildContext context) {
       // final firstTitle = titlee?.isNotEmpty == true ? titlee![1].title : 'عنوان پیشفرض';
      //  print("yyyyyyyyyyyyy:::::::$firstTitle");

      final List<String> texts = [
     "Text1",
     "Text1",
     "Text1",
     ]; 
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
       body:  BlocBuilder<DetailsGhazaliatHafezBloc,DetailsGhazaliatHafezState>(
       builder: (context, state) {
        print("StateDetails::::::::$state");
          if (state is DetailsGhazaliatHafezLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }else if (state is DetailsGhazaliatHafezSuccesState) {
            return   
            Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyAppBar(),
       Expanded(
  child: Stack(
    clipBehavior: Clip.none,
    children: [
    Positioned(
      top: 5,
      left: 29,
      right: 29,
      bottom: 13,
      child: Container(
        decoration:  BoxDecoration(
          border: Border.all(color: MyColors.borderBottomColor),
          color: MyColors.boxBottomColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        height: MediaQuery.of(context).size.height * 0.8, 
       child:  Column(
         children: [
           const Gap(22),
           Text("hhh",style: Theme.of(context)
                .textTheme
                .titleLarge!.copyWith(fontSize: 12),),
SizedBox(
  height:346,
  width: double.infinity,
  child: ListView.builder(
      itemCount: state.detailsghazaliatHafez.length,
      itemBuilder: (context, index) {
       //final text = texts[index];
         final text = state.detailsghazaliatHafez[index];
         final isEvenIndex = index.isEven;
       return 
          Padding(
           padding: EdgeInsets.all(8.0),
           child: Text(
           textAlign: isEvenIndex ? TextAlign.right : TextAlign.left,
                text.text,
             style: const TextStyle(fontSize: 16.0),
           ),
         );
      },
    ),
),
  Expanded(
  child: Padding(
    padding:  EdgeInsets.only(bottom: MyDimensions.xlarge*5),
    child: CustomDivider(endIndent: 50, indent: 50),
  )),

  Text("تفسیر",style: Theme.of(context)
                .textTheme
                .titleLarge!.copyWith(fontSize: 12),),
    const Gap(20),
    SizedBox(
  height:100,
  width: double.infinity,
  child: ListView.builder(
      itemCount: state.detailsghazaliatHafez.length,
      itemBuilder: (context, index) {
       final text = state.detailsghazaliatHafez[index];
       return 
          Padding(
           padding: const EdgeInsets.only(left: 20,right:20 ),
           child: Text(
             textAlign: TextAlign.right,
             text.text,
             style: Theme.of(context)
                .textTheme
                .titleLarge!.copyWith(fontSize: 10),
           ),
                   );
      },
    ),
),
const Gap(100),
         ],
       ),
      ),
    ),
      Positioned(
        bottom: -10,
        left: 47,
        right: 47,
        child: Container(
          decoration: const BoxDecoration(
              color: MyColors.musicBoxColor,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
height: MediaQuery.of(context).size.height * 0.10,          
          child: Column(
            children: [
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/pause.png',),
                  Image.asset('assets/icons/play.png',),
                  Image.asset('assets/icons/Rectangle.png',),
                ],
              ),
              const Gap(15),
              LinearPercentIndicator(
                percent:  1.0,
                backgroundColor: MyColors.backgroundpercentMusicColor,
                progressColor: MyColors.percentMusicColor,
              )
            ],
          ),
      ),
    ),
    ],
  ),
),
          const Gap(20),
            MyBottomNavigation(context: context,),
        ],
      );
         
       }
       else if (state is DetailsGhazaliatHafezErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            print('cannot detect state DetailsGhazaliat');
            return Container();
          }
       }),
      ),
    );
  }


}
