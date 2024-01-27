
import 'package:hafez/core/bottomnavigationbar/custom_buttom_navigation.dart';
import 'package:hafez/core/components/customwidgets/custom_button.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/pressentation/mainscreen/main_screen.dart';
import 'package:hafez/pressentation/screens/home_screen/widgets/list_buttoms_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class HomeScreen extends StatelessWidget {
    // final   PageController pageController;
  //   const HomeScreen(
    
  //    this.pageController,
  // ) : super();
  
  @override
  Widget build(BuildContext context) {
 

 
    //  PageController _pageController = PageController();
    return SafeArea(
  child: Scaffold(
 //bottomNavigationBar: MyBottomNavigation(),
    backgroundColor: MyColors.primaryColor,
    body: SizedBox(
      height:
            UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
        width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Gap(MyDimensions.xlarge+60),
          Center(child: Image.asset('assets/images/hafez.png')),
           Gap(MyDimensions.xlarge+55),
          Expanded(
            child: ListView.separated(
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
               return listBottomsWidget(index,context);

              },
              separatorBuilder: (context, index) =>  Gap(MyDimensions.small+1),
              itemCount: 1,
            ),
          ),
           Gap(MyDimensions.large-2),
        
            // MyBottomNavigation(),
        ],
      ),
    ),
  ),
);
  }
}
