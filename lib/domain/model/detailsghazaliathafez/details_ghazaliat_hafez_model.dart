
class DetailsGhazaliatHafezModel{
final  String text;
DetailsGhazaliatHafezModel({required this.text});
factory DetailsGhazaliatHafezModel.fromJason(Map<String,dynamic>json)=>
DetailsGhazaliatHafezModel(text: json['text']);
}