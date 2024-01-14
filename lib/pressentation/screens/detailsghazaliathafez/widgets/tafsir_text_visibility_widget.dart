import 'package:flutter/material.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';

class TafsirTextVisibilityWidget extends StatelessWidget {
  final String? tafsir;
  TafsirTextVisibilityWidget({Key? key, this.tafsir}) : super(key: key);
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Text(
                tafsir ?? '', // Ensure widget.tafsir is not null
                textAlign: TextAlign.center,
                style: MyTHeme.lightTheme().textTheme.titleLarge!.copyWith(fontSize: 6),
              ),
            ),
          ],
        );
      },
    );
  }
}
