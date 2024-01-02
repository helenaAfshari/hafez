import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  final String word;

  const TwoScreen({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1, // تعداد مورد واحد لیست
          itemBuilder: (context, index) {
            return Container(
              color: Colors.amber,
              height: 50,
              alignment: Alignment.center,
              child: Text(word),
            );
          },
        ),
      ),
    );
  }
}
