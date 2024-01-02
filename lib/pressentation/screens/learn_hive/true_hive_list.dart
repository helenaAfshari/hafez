import 'package:flutter/material.dart';
class TrueHiveList extends StatefulWidget {
  const TrueHiveList({super.key});
  @override
  State<TrueHiveList> createState() => _TrueHiveListState();
}

class _TrueHiveListState extends State<TrueHiveList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Hive")),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => null,),
    );
  }
}