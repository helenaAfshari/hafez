
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_button.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/theme/my_theme.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
  child: Scaffold(
    backgroundColor: MyColors.primaryColor,
    body: SizedBox(
      height:
            UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
        width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Positioned(
        top: 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(100),
            Center(child: Image.asset('assets/images/hafez.png')),
            const Gap(95),
            Expanded(
              child: ListView.separated(
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildListItems(index,context);
                },
                separatorBuilder: (context, index) => const Gap(5),
                itemCount: 2,
              ),
            ),
            const Gap(30),
          
            const MyBottomNavigation(),
          ],
        ),
      ),
    ),
  ),
);

  }
}

Widget _buildListItems(int index,BuildContext context){
  return 
  CustomButtonWidget(
       margin: const EdgeInsets.only(left: 67.0,right: 67.0),
     height: UIUtils.getConvertedHeight(context,53),
     width: UIUtils.getConvertedWidth(context,226),
     borderRadius: const BorderRadius.all(Radius.circular(8.0)),
     color: MyColors.boxBottomColor,
     border: Border.all(color: MyColors.borderBottomColor),
      text: "غزلیات حافظ",
    textStyle:Theme.of(context)
    .textTheme
    .titleLarge,
    onPress: () {
    
  },);
}