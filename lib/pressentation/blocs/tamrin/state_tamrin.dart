
import 'package:equatable/equatable.dart';

// class AppStates extends Equatable{
  
// AppStates({this.tabStatuse=true});
// final bool tabStatuse;

// AppStates changeTab(){
//   return AppStates(tabStatuse: !tabStatuse);
// }

//   @override
//   List<Object?> get props => [tabStatuse];
// }

abstract class AppStates{
  final bool tabStatuse = true;

  // AppStates changeTab() {
  //   return AppStates(tabStatuse: !tabStatuse);
  // }


}


