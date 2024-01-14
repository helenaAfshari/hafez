// import 'package:gap/gap.dart';
// import 'package:hafez/core/resource/constants/my_colors.dart';
// import 'package:hafez/core/resource/constants/my_dimensions.dart';
// import 'package:hafez/core/resource/constants/my_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:hafez/core/resource/constants/theme/my_theme.dart';

// class BottomSheetTafsirWidget extends StatelessWidget {
//   final String tafsirText;
//    const BottomSheetTafsirWidget({super.key, required this.tafsirText});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
//           context: context,
//           builder: (BuildContext builder) {
//             return Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                       Gap(MyDimensions.light+5),
//                     Text(MyStrings.tafsirPoint,
//                     style: MyTHeme.lightTheme().textTheme.titleLarge!.copyWith(color: MyColors.tafsirTextColor),),
//                     Gap(MyDimensions.light+5),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30, left: 25),
//                       child: Text(
//                         tafsirText,
//                         textAlign: TextAlign.center,
//                         style: MyTHeme.lightTheme().textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal)
//                       ),
//                     ),
//                     Gap(MyDimensions.light+5),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(MyColors.musicBoxColor),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text(MyStrings.close),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       child: const Text(
//         MyStrings.tafsir,
//         style: TextStyle(color:MyColors.tafsirTextColor),
//       ),
//     );
//   }
// }
