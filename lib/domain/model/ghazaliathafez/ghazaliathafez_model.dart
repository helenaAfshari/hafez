
class GhazaliatHafezModel {
  int? id;
  String? title;
  GhazaliatHafezModel.fromJason(Map<dynamic,dynamic>jason){
    id = jason['id'];
    title = jason['title'];
  }
}