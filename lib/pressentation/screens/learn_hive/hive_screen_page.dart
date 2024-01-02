
import 'package:autharization_hanna/pressentation/screens/learn_hive/two_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHiveScreen extends StatelessWidget {
  const MyHiveScreen({super.key});
  
 

  @override
  Widget build(BuildContext context) {
     List<String>words = [
      "Text1111111111111",
      "Text22222222222",
      "Text3333333333",
      "Text33333333",
      "Text",
    ];
    return Scaffold(
     appBar: AppBar(
  title: Text("FavoriteApp"),
  actions: [
    IconButton(
      icon: Icon(Icons.favorite),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TwoScreen(word: words.toString(),),
          ),
        );
      },
    ),
  ],
),

     body: ValueListenableBuilder(valueListenable: Hive.box('favorites').listenable(),
     builder: (context, box, child) {
       return 
       ListView.builder(
      itemCount: words.length,
    itemBuilder: (context, index) {
      final isFavorite = box.get(index) != null;
       return ListTile(
        title: Text(words.toString()),
        trailing: IconButton(
        icon: Icon(
       isFavorite? Icons.favorite :Icons.favorite_border ,
        color: Colors.red,), 
      
       onPressed: () async {
  ScaffoldMessenger.of(context).clearSnackBars();

  if (isFavorite) {
    await box.delete(index);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Remove"),
      ),
    );
  } else {
    await box.put(index, words);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Successfully")),
    );

    // Navigate to TwoScreen and pass the word
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TwoScreen(word: words.toString()),
      ),
    );
  }
},

        ),
       );
     },);
     },
     )
    );
  }
}