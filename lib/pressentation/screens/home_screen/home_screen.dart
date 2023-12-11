
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez.dart';
import 'package:autharization_hanna/pressentation/screens/home_screen/component/list_buttoms_widget.dart';
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
                  return listBottomsWidget(index,context);
                },
                separatorBuilder: (context, index) => const Gap(5),
                itemCount: 1,
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
