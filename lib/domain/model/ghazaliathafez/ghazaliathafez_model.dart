
class GhazalItemModelEntity {
  int? id;
  String? title;
  GhazalItemModelEntity.fromJason(Map<dynamic,dynamic> json)
  : id = json['id'],
    title=json['title'];
    
    static List<GhazalItemModelEntity>parseGhazalTo(
      List<dynamic>ghazalTojason){
       final List<GhazalItemModelEntity>ghazalToList=[];
       ghazalTojason.forEach((element) {
        ghazalToList.add(GhazalItemModelEntity.fromJason(element));
       });
       return ghazalToList;
      }
    



  // GhazItemModel({required this.id,required this.title});
  // factory GhazItemModel.fromJson(Map<String,dynamic>json)=>
  // GhazItemModel(
  //   id: json['id'],
  //   title: json['title']
  // );
  
}


