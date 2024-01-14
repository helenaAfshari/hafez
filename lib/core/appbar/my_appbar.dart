
import 'package:hafez/core/appbar/my_appbar_items.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey();

class MyAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 

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
    builder: (context) => HomeScreen(),
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
           );
  }
}