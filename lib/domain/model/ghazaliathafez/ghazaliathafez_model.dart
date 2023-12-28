
class GhazalItemModelEntity {
  int? id;
  String? title;
  String? tafsir;
  GhazalItemModelEntity({ this.id, this.title, this.tafsir});
  factory GhazalItemModelEntity.fromJson(Map<String,dynamic>json)=>
  GhazalItemModelEntity(id: json['id'], title: json['title'],tafsir: json['tafsir']);
}
// class GhazalModelItems {
//   final int? id;
//   final String? title;
//   // final String? modelEnglishName;
//   GhazalModelItems.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         title = json["title"];
//   static List<GhazalModelItems> parseGhazalModelItems(List<dynamic> ghazalModeljson) {
//     final List<GhazalModelItems> ghazalModelList = [];
//     ghazalModeljson.forEach((element) {
//       ghazalModelList.add(GhazalModelItems.fromJson(element));
//     });
//     return ghazalModelList;
//   }
// }

// class GhazalModelEntity {
//   final List<GhazalModelItems> ghazalModels;
//   GhazalModelEntity.fromList(List<dynamic> ghazalModelList)
//       : ghazalModels = GhazalModelItems.parseGhazalModelItems(ghazalModelList);
// }
   // ghazaliatHafez = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

// class CarModelItems {
//   final int? carModelId;
//   final String? modelName;
//   final String? modelEnglishName;
//   CarModelItems.fromJson(Map<String, dynamic> json)
//       : carModelId = json['carModelId'],
//         modelName = json["modelName"],
//         modelEnglishName = json["modelEnglishName"];
//   static List<CarModelItems> parseCarModelItems(List<dynamic> carModelJson) {
//     final List<CarModelItems> carModelList = [];
//     carModelJson.forEach((element) {
//       carModelList.add(CarModelItems.fromJson(element));
//     });
//     return carModelList;
//   }
// }

// class CarModelEntity {
//   final List<CarModelItems> carModels;
//   CarModelEntity.fromList(List<dynamic> carModelList)
//       : carModels = CarModelItems.parseCarModelItems(carModelList);
// }
















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
  



