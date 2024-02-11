
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
  final GlobalKey<ScaffoldState> _estekhareKey = GlobalKey();
   int indext =0;
  @override
  void initState() {
    super.initState();
    //  Future.delayed(const Duration(seconds: 7), () {
    //   // setState(() {
    //   //   opacity = 0;
    //   // });

    // });
  }
  double opacity = 1.0;
  bool _isClicked =false;
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
        body: 
  
            BlocBuilder<BlocEstekhare,StekharehState>(builder: (context, state) {
              if(state is LoadingEstekhareState){
                return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
              } 
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
  
return 1;
  }
     return 
GestureDetector(
  onTapDown: (TapDownDetails details) {
                      setState(() {
          _isClicked = true;
          _tapPosition = details.globalPosition;
        });

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
         if (_isClicked && _tapPosition != null)
        Positioned(
          left: _tapPosition!.dx - 1,
          top: 0,
          right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
          bottom: 0,
          child: Container(
            width: 10,
            color:_isClicked? const Color.fromARGB(255, 243, 4, 4):Colors.blue,
          ),
        ),
    ],
  ),
);
              }       
     return Container();
            },
            ),
     ),
   );
  } 
}






