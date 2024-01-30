
import 'package:flutter/material.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
// class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBarWidget({
//     this.title = '',
//     this.leading,
//     this.titleWidget,
//     this.showActionIcon = false,
//      this.backgroundColor = Colors.transparent,
//     this.scaffoldKey, // اضافه کردن کلید گلوبال به عنوان ورودی
//   });

//   final String title;
//   final Widget? leading;
//   final Widget? titleWidget;
//   final bool showActionIcon;
//    final Color backgroundColor;
//   final GlobalKey<ScaffoldState>? scaffoldKey; // تعریف کلید گلوبال به عنوان ورودی

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25 / 10),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: titleWidget == null
//                   ? Center(
//                       child: Text(
//                         title,
//                         style: MyTHeme.lightTheme().textTheme.titleLarge,
//                       ),
//                     )
//                   : Center(
//                       child: titleWidget!,
//                     ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 leading ??
//                     Transform.translate(
//                       offset: const Offset(-14, 0),
//                       child: const BackButton(),
//                     ),
//                 if (showActionIcon)
//                   Transform.translate(
//                     offset: Offset(10, 0),
//                     child: InkWell(
//                       onTap: () {
//                         scaffoldKey?.currentState?.openEndDrawer();
//                       },
//                       child:  Padding(
//                         padding: EdgeInsets.all(MyDimensions.light+2),
//                         child: const Icon(Icons.menu),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size(double.maxFinite, 100);
// }

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    this.title = '',
    this.leading,
    this.titleWidget,
    this.showActionIcon = false,
    this.scaffoldKey,

    this.backgroundColor = Colors.transparent,
    this.backgroundBehindColor = MyColors.bottomNavigationBarBackgroundColor, // اضافه کردن پارامتر رنگ پس‌زمینه پشتی
  });

  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color backgroundColor;
  final Color backgroundBehindColor; // تعریف پارامتر رنگ پس‌زمینه پشتی

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: MyColors.bottomNavigationBarBackgroundColor, // اعمال رنگ پس‌زمینه پشتی
            height: preferredSize.height + MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25 / 10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: titleWidget == null
                      ? Center(
                          child: Text(
                            title,
                            style: MyTHeme.lightTheme().textTheme.titleLarge,
                          ),
                        )
                      : Center(
                          child: titleWidget!,
                        ),
                ),
                Container(
                  color: backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      leading ??
                          Transform.translate(
                            offset: const Offset(-14, 0),
                            child: const BackButton(),
                          ),
                      if (showActionIcon)
                        Transform.translate(
                          offset: const Offset(10, 0),
                          child: InkWell(
                            onTap: () {
                              scaffoldKey?.currentState?.openEndDrawer();
                             
                            },
                            child: Padding(
                              padding: EdgeInsets.all(MyDimensions.light + 2),
                              child: const Icon(Icons.menu),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
