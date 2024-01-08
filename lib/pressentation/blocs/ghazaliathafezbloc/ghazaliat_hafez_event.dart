
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';

abstract class GhazaliatHafezEvent{}
class GhazaliatHafezStart extends GhazaliatHafezEvent{
}
  class InisialEvent extends GhazaliatHafezStart{
  }
class LoadedEvent extends GhazaliatHafezStart{
   
}
class LoadMoreEvent extends GhazaliatHafezStart {
}

class ChangeTabEvent extends GhazaliatHafezStart {
  final int index;
  ChangeTabEvent( this.index);
}

class GhazaliatEditedEvent extends GhazaliatHafezEvent {
  final FavoriteModel character;
  final int index;
  GhazaliatEditedEvent({required this.character, required this.index});
  
}




