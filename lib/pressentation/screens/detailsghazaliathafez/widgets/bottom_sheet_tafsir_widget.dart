import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:flutter/material.dart';

class BottomSheetTafsirWidget extends StatelessWidget {
  final String tafsirText;
   const BottomSheetTafsirWidget({super.key, required this.tafsirText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 25),
                      child: Text(
                        tafsirText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(MyColors.musicBoxColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(MyStrings.close),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Text(
        MyStrings.tafsir,
        style: TextStyle(color:MyColors.tafsirTextColor),
      ),
    );
  }
}
