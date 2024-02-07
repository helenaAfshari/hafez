
import 'package:equatable/equatable.dart';

class AppStates extends Equatable{
  
AppStates({this.tabStatuse=true});
final bool tabStatuse;

AppStates changeTab(){
  return AppStates(tabStatuse: !tabStatuse);
}

  @override
  List<Object?> get props => [tabStatuse];

}