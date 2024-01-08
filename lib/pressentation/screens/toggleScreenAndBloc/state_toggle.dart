
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';

//   class AppSatate extends Equatable{
//   AppSatate({
//   this.tabStatuse=true,
//   });
  
//  final bool tabStatuse;
//  AppSatate changeTab({ required selectedIndex}){
//  return AppSatate(
//   tabStatuse: !tabStatuse,
//  );
//  }
 
//   @override
//   List<Object?> get props => [tabStatuse];
// }



// class AppSatate extends Equatable {
//   AppSatate({
//     this.tabStatuse = true,
//   });

//   final bool tabStatuse;

//   AppSatate changeTab({required selectedIndex}) {
//     return AppSatate(
//       tabStatuse: !tabStatuse,
//     );
//   }

//   @override
//   List<Object?> get props => [tabStatuse];
// }
// class AppSatate extends Equatable {
//   AppSatate({
//     this.tabStatuse = true,
//   });

//   final bool tabStatuse;


//   AppSatate changeTab({required selectedIndex}) {
//     // اعمال تغییرات مربوط به newIds، مثلاً اضافه کردن یک مقدار جدید

//     return AppSatate(
//       tabStatuse: !tabStatuse,
    
//     );
//   }

//   @override
//   List<Object?> get props => [tabStatuse];
// }

class AppSatate extends Equatable {
  AppSatate({
    required this.iconStatusList,
    required this.ghazaliatHafez,
  });

  final List<bool> iconStatusList;
  final List<GhazalItemModelEntity> ghazaliatHafez;

  AppSatate changeTab({required int selectedIndex}) {
    List<bool> updatedList = List.from(ghazaliatHafez);
    updatedList[selectedIndex] = !updatedList[selectedIndex];
    return AppSatate(
      iconStatusList: updatedList,
      ghazaliatHafez: ghazaliatHafez,
    );
  }

  @override
  List<Object?> get props => [iconStatusList, ghazaliatHafez];
}


// abstract class AppSatate extends Equatable {}

// class changeTab extends AppSatate{
//      bool tabStatuse = true;
//      changeTab({required this.tabStatuse});

//   @override
//   List<Object?> get props => [tabStatuse];

// }
