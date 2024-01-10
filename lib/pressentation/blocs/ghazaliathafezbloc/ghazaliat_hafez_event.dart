
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/test_model.dart';

abstract class GhazaliatHafezEvent{}
class GhazaliatHafezStart extends GhazaliatHafezEvent{
}
  // class InisialEvent extends GhazaliatHafezStart{
  // }
class LoadedEvent extends GhazaliatHafezStart{
   
}
class LoadMoreEvent extends GhazaliatHafezStart {
}

// class ChangeTabEvent extends GhazaliatHafezStart {
//   final int index;
//   ChangeTabEvent( this.index);
// }

// class GhazaliatEditedEvent extends GhazaliatHafezEvent {
//   final Todo character;
//   final int index;
//   GhazaliatEditedEvent({required this.character, required this.index});
  
// }


final class cccccc extends GhazaliatHafezEvent {
  cccccc( {required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}





