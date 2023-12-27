
class DetailsGhazaliatHafezModel{
final  String text;
  int poemId;
DetailsGhazaliatHafezModel({required this.text,required this.poemId});
factory DetailsGhazaliatHafezModel.fromJason(Map<String,dynamic>json)=>
DetailsGhazaliatHafezModel(text: json['text'],poemId: json['poem_id']);
}