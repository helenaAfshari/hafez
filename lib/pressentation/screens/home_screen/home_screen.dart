
import 'package:autharization_hanna/core/resource/constants/mycolor/my_colors.dart';
import 'package:autharization_hanna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: HomeBloc(),
//     child: ,
    
//     ),
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height:  UIUtils.getConvertedHeight(context, UIUtils.screenHeightInFigma),
            width: UIUtils.getConvertedWidth(context, UIUtils.screenWidthInFigma),
            child: Positioned(
              top: .1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(20),
                  Center(child: Image.asset('assets/images/hafez.png')),
                ],
              ),
            ),
          ),
        )
      ),
      );
  }
}