
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
class AppSatate extends Equatable {
  AppSatate({
    this.tabStatuse = true,
  });

  final bool tabStatuse;


  AppSatate changeTab({required selectedIndex}) {
    // اعمال تغییرات مربوط به newIds، مثلاً اضافه کردن یک مقدار جدید

    return AppSatate(
      tabStatuse: !tabStatuse,
    
    );
  }

  @override
  List<Object?> get props => [tabStatuse];
}


// abstract class AppSatate extends Equatable {}

// class changeTab extends AppSatate{
//      bool tabStatuse = true;
//      changeTab({required this.tabStatuse});

//   @override
//   List<Object?> get props => [tabStatuse];

// }
