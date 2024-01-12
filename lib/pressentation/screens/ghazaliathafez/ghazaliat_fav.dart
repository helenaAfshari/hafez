import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GhazaliatFav extends StatefulWidget {
  const GhazaliatFav({super.key});

  @override
  State<GhazaliatFav> createState() => _GhazaliatFavState();
}

class _GhazaliatFavState extends State<GhazaliatFav> {

  final box  = Hive.box<Map>(name: 'favBox');
  List<GhazalItemModelEntity> ghazaliat = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      
      for (final favEntities in box.keys) { 
        ghazaliat.add(GhazalItemModelEntity.fromJson(box.get(favEntities)! as Map<String, dynamic>));
        setState(() {
          
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemCount: ghazaliat.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(ghazaliat.elementAt(index).title ?? 'title is empty'),
      ),
      ),
    );
  }
}