import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hafez/core/components/customwidgets/custom_divider.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/core/utils/ui_utils.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:share_plus/share_plus.dart';

class ListGhazaliatFavoriteWidget extends StatelessWidget {
  const ListGhazaliatFavoriteWidget({
    super.key,
    required this.scrollController,
    required this.ghazaliatItemModel,
    required this.ghazaliat,
  });

  final ScrollController scrollController;
  final List<GhazalItemModelEntity> ghazaliatItemModel;
  final List<GhazalItemModelEntity> ghazaliat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
      width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(MyDimensions.large + 3),
          Expanded(
              child: ListView.separated(
            controller: scrollController,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => GhazaliatHafezBloc(),
                      child: DetailsGhazaliatHafezScreen(
                        GhazaliatModel: ghazaliatItemModel[index],
                        index: ghazaliat.elementAt(index).id!,
                      ),
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyDimensions.small),
                    color: MyColors.boxBottomColor,
                    border: Border.all(color: MyColors.borderBottomColor),
                  ),
                  margin: EdgeInsets.only(
                      left: MyDimensions.semiLarge + 5,
                      right: MyDimensions.semiLarge + 5),
                  height: MyDimensions.xlarge + 50,
                  width: MyDimensions.minMobileSize - 28,
                  child: Padding(
                    padding: EdgeInsets.only(right: MyDimensions.medium + 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MyDimensions.small + 1,
                              top: MyDimensions.small + 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(MyDimensions.small),
                              StatefulBuilder(builder: (context, setState) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        print("shareeee::::::::::");

                                        await Share.share(MyStrings.shareText);
                                      },
                                      child:
                                          Image.asset("assets/icons/share.png"),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                        Text(
                          ghazaliat.elementAt(index).title ?? "title",
                          style: MyTHeme.lightTheme().textTheme.titleLarge,
                        ),
                        Text(
                          ghazaliat.elementAt(index).firstStanza ?? '',
                          style: MyTHeme.lightTheme().textTheme.titleLarge,
                        ),
                        Gap(MyDimensions.xLight - 2),
                        Expanded(
                          child: CustomDivider(
                            indent: MyDimensions.light + 2,
                            endIndent: MyDimensions.light + 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(MyDimensions.light + 2),
            itemCount: ghazaliat.length,
          )),
          Gap(MyDimensions.large - 2),
          // MyBottomNavigation(),
        ],
      ),
    );
  }
}
