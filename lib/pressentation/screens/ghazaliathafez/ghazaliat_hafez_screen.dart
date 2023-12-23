
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
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
            if(state is ItemSelectedState){
              final selectedItemId = state.selectedItemId;
              //اشتباهه مثل nav که نوشتم باید بنویسم و داخل کانستراکتوذ اسکرین هم باید ایدی را بزارم که بتونم بگیرم 
                   Navigator.pushNamed(context, '/DetailsGhazaliatHafezScreen', arguments: selectedItemId);

                 

    }
            
            if (state is GhazaliatHafezLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            } else if (state is GhazaliatHafezSuccesState) {
              return
              SizedBox(
             height:
            UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
        width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const MyAppBar(),
        const Gap(35),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
               return 
                GestureDetector(
                  onTap: () {
               BlocProvider.of<GhazaliatHafezBloc>(context).add(ItemSelectedEvent(index));
               print("iddddddddddd:::::::$index");
                  },
                  child: Container(
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
                   Padding(
                               padding: const EdgeInsets.only(left: 5,top: 5),
                               child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                          const Gap(3),
                          Row(
                             children: [
                              StatefulBuilder(builder: (context, setState) {
                              return GestureDetector(
                  onTap: ()async {
                    await Share.share(MyStrings.shareText);
                   },
                  child:  Image.asset(
                          "assets/icons/share.png",
                              ));
                            },),
                            const Gap(5),
                               StatefulBuilder(builder: (context, setState) {
                              return GestureDetector(
                  onTap: () {
                    setState(() {
                    isHeartSelected=!isHeartSelected;
                    },);},
                  child:  Image.asset(
                            isHeartSelected ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",
                              ));
                            },),
                             ],
                          ),],),
                   ),
                   Text(state.ghazaliatHafez[index].title,style: Theme.of(context)
                     .textTheme
                     .titleLarge!.copyWith(fontSize: 12),
                     ),
                   Text("الی یا ابها",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 10),),
                   const Gap(10),
                  Expanded(child: CustomDivider(indent: 10,endIndent: 10,)),
                               ],
                             ),),),
                );},
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: state.ghazaliatHafez.length),
            ),
          const Gap(30),
           MyBottomNavigation(),
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