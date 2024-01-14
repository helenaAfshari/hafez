
import 'package:hafez/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey();

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
  }}
  );}
   @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
    final url = Uri.parse('https://hafezname.ir/');
    return SafeArea(
      child: Scaffold(
        key: _key,
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
                    const Text(MyStrings.suport),
                    Gap(MyDimensions.xlarge-5),
                     Image.asset('assets/icons/support.png',),
                  ],
                ),
                 Gap(MyDimensions.medium),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                            print("Clicked");
                          }
                      },
                      child: const Text(MyStrings.websiteHafez)),
                    Gap(MyDimensions.xlarge-5),
                     GestureDetector(
                      onTap: () async {
                          
                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                            print("Clicked");
                          }
                      },
                      child: Image.asset('assets/icons/website.png',)),
                  ],
                )
              ],
            ) ,),
        
        ),
       appBar: AppBar(
        elevation: 0.0,
         automaticallyImplyLeading: false,
        backgroundColor:  MyColors.primaryColor,

        actions: [
            Container(
       width:
           UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
       alignment: Alignment.center,
      // margin: MyPaddings.horizontal20,
       padding: MyPaddings.all12,
       decoration: const BoxDecoration(
        // color:  MyColors.primaryColor,
       ),
       child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
               GestureDetector(
                onTap: () =>Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  ),
),
                child: 
                Icon(Icons.arrow_back,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,)),
              Gap(MyDimensions.semiLarge-4),
             Text(MyStrings.ghazaliatHafezText,style: MyTHeme.lightTheme().textTheme.titleLarge,),
              Gap(MyDimensions.light+3),
           GestureDetector(
            onTap: () {
              _key.currentState!.openEndDrawer();
            },
            child: Icon(Icons.menu,size: MyDimensions.medium+5,color: MyColors.primaryButtonColor,))
           ],
         ),
           ),
        ],
       ),
        
        backgroundColor: MyColors.primaryColor,
        body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
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
        //const MyAppBar(),
      
         Gap(MyDimensions.large+3),
          Expanded(
            child: ListView.separated(
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
                  //  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: MyDimensions.light+2),),
                    // Gap( MyDimensions.xLight-2),
                  CustomDivider(indent: MyDimensions.light+2,endIndent: MyDimensions.light+2,),
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





