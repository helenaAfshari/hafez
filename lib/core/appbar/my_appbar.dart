import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
 GlobalKey<ScaffoldState> key = GlobalKey();

   MyAppBar({ required this.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: MyColors.primaryColor,
      actions: [
        Container(
          width: UIUtils.getConvertedWidth(
              context, UIUtils.screenWidthInFigma),
          alignment: Alignment.center,
          padding: MyPaddings.all12,
          decoration: const BoxDecoration(
            // color: MyColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back,
                    size: MyDimensions.medium + 5,
                    color: MyColors.primaryButtonColor),
              ),
              Gap(MyDimensions.semiLarge - 4),
              Text(
                MyStrings.ghazaliatHafezText,
                style: MyTHeme.lightTheme().textTheme.titleLarge,
              ),
              Gap(MyDimensions.light + 3),
              GestureDetector(
                onTap: () {
                  key.currentState!.openEndDrawer();
                },
                child: Icon(Icons.menu,
                    size: MyDimensions.medium + 5,
                    color: MyColors.primaryButtonColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
