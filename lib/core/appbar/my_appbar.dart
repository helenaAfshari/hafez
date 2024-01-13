
import 'package:hafez/core/appbar/my_appbar_items.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
       width:
           UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
       alignment: Alignment.center,
      // margin: MyPaddings.horizontal20,
       padding: MyPaddings.all12,
       decoration: const BoxDecoration(
         color:  MyColors.primaryColor,
       ),
       child:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
               GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back,size: MyDimensions.medium+5)),
             const Gap(20),
             Text("غزلیات حافظ",style: Theme.of(context)
                .textTheme
                .titleLarge,),
             const Gap(11),
               Icon(Icons.menu,size: MyDimensions.medium+5),
           ],
         ),
           );
  }
}