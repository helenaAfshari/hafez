
class TotalModel {
    String? total;
TotalModel({this.total});
factory TotalModel.fromJason(Map<String,dynamic>json)=>
TotalModel(total: json['total']);

// factory DetailsGhazaliatHafezModel.fromJason(Map<String,dynamic>json)=>
// DetailsGhazaliatHafezModel(text: json['text'],poemId: json['poem_id']);

}