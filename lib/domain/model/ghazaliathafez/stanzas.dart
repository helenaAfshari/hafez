
class StanzasModel {
 final int? id;
 final int? poemId;
final  String? text;
  StanzasModel({ this.id, this.text,this.poemId});
  factory StanzasModel.fromJson(Map<String,dynamic>json)=>
  StanzasModel(id: json['id'], text: json['text'],poemId: json['poem_id']);
}