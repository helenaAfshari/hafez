
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/appbar/my_appbar.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey();

class EstekhareScreen extends StatefulWidget {
  @override
  _EstekhareScreenState createState() => _EstekhareScreenState();
}
class _EstekhareScreenState extends State<EstekhareScreen> {
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
      scaffoldKey: _key,
      showActionIcon: true,
      title: MyStrings.ghazaliatHafezText,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const BackButton()),
        ),
       body: GestureDetector(
       onTapDown: (TapDownDetails details) {
        setState(() {
          _isClicked = !_isClicked;
          _tapPosition = details.globalPosition;
        });
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
        ),
     ),
   );
  }
}




