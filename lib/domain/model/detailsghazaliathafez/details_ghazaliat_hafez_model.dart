
class DetailsGhazaliatHafezModel{
  String? text;
  int? poemId;
DetailsGhazaliatHafezModel({ this.text, this.poemId});
factory DetailsGhazaliatHafezModel.fromJason(Map<String,dynamic>json)=>
DetailsGhazaliatHafezModel(text: json['text'],poemId: json['poem_id']);
}