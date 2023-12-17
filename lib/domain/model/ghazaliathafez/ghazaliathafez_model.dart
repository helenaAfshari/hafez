
class GhazalItemModelEntity {
 final int id;
final  String title;
  GhazalItemModelEntity({required this.id,required this.title});
  factory GhazalItemModelEntity.fromJson(Map<String,dynamic>json)=>
  GhazalItemModelEntity(id: json['id'], title: json['title']);
}

// class GhazalItemModelEntity {
//   int? id;
//   String? title;
//   GhazalItemModelEntity.fromJason(Map<String,dynamic> json)
//   : id = json['id'],
//     title=json['title'];
//     static List<GhazalItemModelEntity>parseGhazalTo(
//       List<dynamic>ghazalTojason){
//        final List<GhazalItemModelEntity>ghazalToList=[];
//        ghazalTojason.forEach((element) {
//         ghazalToList.add(GhazalItemModelEntity.fromJason(element));
//        });
//        return ghazalToList;
//       }
    



  // GhazItemModel({required this.id,required this.title});
  // factory GhazItemModel.fromJson(Map<String,dynamic>json)=>
  // GhazItemModel(
  //   id: json['id'],
  //   title: json['title']
  // );
  



