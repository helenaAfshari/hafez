import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:share_plus/share_plus.dart';
class ListGhazaliatWidget extends StatelessWidget {
  const ListGhazaliatWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
      builder: (context, state) {
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
     Gap(MyDimensions.large+3),
      Expanded(
        child:ListView.separated(
          controller: scrollController,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
           return 
            GestureDetector(
              onTap: () {
             int adjustedIndex = index < 17 ? index+1  : index+1;
                            Navigator.of(context).push(MaterialPageRoute(  
                              builder: (context) => BlocProvider(
                                create: (context) => GhazaliatHafezBloc(),
                                child: DetailsGhazaliatHafezScreen(
                                  GhazaliatModel: k[index],
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
                  height: MyDimensions.xlarge+50,
                   width:MyDimensions.minMobileSize-28,
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
               Gap(MyDimensions.light+2),
               GestureDetector(
                onTap: ()async {
 BlocProvider.of<GhazaliatHafezBloc>(context).add(ChangeColorButtomListClickedEventtt(id: k[index].id!));
  },
     child: 
    Image.asset(
 (k[index].isLiked ?? false) ? "assets/icons/selected_heart.png" : "assets/icons/unselected_heart.png",
),
              ),
                          ],
                        );
                      },),],),
               ),
               Text(state.ghazaliatHafez[index].title!,style: MyTHeme.lightTheme().textTheme.titleLarge,
                 ),
               Text(state.ghazaliatHafez[index].firstStanza!,
               style: MyTHeme.lightTheme().textTheme.headlineSmall,
               ),
              CustomDivider(indent: MyDimensions.light+2,endIndent: MyDimensions.light+2,),
                           ],
                         ),),),
            );},
          separatorBuilder: (context, index) => Gap(MyDimensions.light+2),
          itemCount: state.ghazaliatHafez.length),
        ),
       Gap(MyDimensions.large-2),
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
    );
  }
}