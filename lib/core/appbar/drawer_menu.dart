import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.primaryColor,
      child: DrawerHeader(
        child: ListView(
          children: [
            Image.asset('assets/images/hafez.png'),
            CustomDivider(endIndent: 10, indent: 10),
            Gap(MyDimensions.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(MyStrings.supportLink))) {
                      await launchUrl(Uri.parse(MyStrings.supportLink));
                    }
                  },
                  child: Text(
                    MyStrings.suport,
                    style: MyTHeme.lightTheme().textTheme.titleLarge,
                  ),
                ),
                Gap(MyDimensions.xlarge - 5),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(MyStrings.supportLink))) {
                      await launchUrl(Uri.parse(MyStrings.supportLink));
                    }
                  },
                  child: Image.asset('assets/icons/support.png'),
                ),
              ],
            ),
            Gap(MyDimensions.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(MyStrings.websiteLink))) {
                      await launchUrl(Uri.parse(MyStrings.websiteLink));
                    }
                  },
                  child: Text(
                    MyStrings.websiteHafez,
                    style: MyTHeme.lightTheme().textTheme.titleLarge,
                  ),
                ),
                Gap(MyDimensions.xlarge - 5),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(MyStrings.websiteLink))) {
                      await launchUrl(Uri.parse(MyStrings.websiteLink));
                    }
                  },
                  child: Image.asset('assets/icons/website.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
