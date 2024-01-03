
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvents extends Equatable{
 
}


class ChangeTabEvent extends AppEvents {
  final int index;

  ChangeTabEvent( this.index);

  @override
  List<Object?> get props => [index];
}


//   class ChangeTab extends AppEvents{
//     ChangeTab();
//      @override
//   List<Object?> get props => [];
//   }

//   class ChangeTab extends AppEvents {
//   final List<GhazalItemModelEntity> ghazaliatList;
//   ChangeTab(this.ghazaliatList);

//   @override
//   List<Object?> get props => [ghazaliatList];
// }