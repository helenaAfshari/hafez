import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowModalBottomSheetWidget extends StatelessWidget {
  const ShowModalBottomSheetWidget({
    super.key,
    required this.widget,
  });
  final DetailsGhazaliatHafezScreen widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
          context: context,
          builder: (BuildContext builder) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(MyDimensions.light + 5),
                  Text(
                    MyStrings.tafsirPoint,
                    style: MyTHeme.lightTheme()
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyColors.tafsirTextColor),
                  ),
                  Gap(MyDimensions.light + 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 25),
                    child: Text(widget.GhazaliatModel!.tafsir!,
                        textAlign: TextAlign.center,
                        style: MyTHeme.lightTheme()
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.normal)),
                  ),
                  Gap(MyDimensions.light + 5),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyColors.musicBoxColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(MyStrings.close),
                  ),
                  Gap(MyDimensions.semiLarge),
                  GestureDetector(
                    onTap: () async {
                      if (await canLaunchUrl(
                          Uri.parse(MyStrings.websiteLink))) {
                        await launchUrl(Uri.parse(MyStrings.websiteLink));
                      }
                    },
                    child: Row(
                      children: [
                        Gap(MyDimensions.xlarge * 3),
                        Text(
                          MyStrings.websiteLink,
                          style: MyTHeme.lightTheme().textTheme.titleLarge,
                        ),
                        Gap(MyDimensions.small),
                        Text(
                          MyStrings.source,
                          style: MyTHeme.lightTheme()
                              .textTheme
                              .titleLarge!
                              .copyWith(color: MyColors.tafsirTextColor),
                        ),
                      ],
                    ),
                  ),
                  Gap(MyDimensions.semiLarge),
                ],
              ),
            );
          },
        );
      },
      child: const Text(
        MyStrings.tafsir,
        style: TextStyle(color: MyColors.tafsirTextColor),
      ),
    );
  }
}
