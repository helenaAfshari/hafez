
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:equatable/equatable.dart';

abstract class GhazaliatHafezEvent{}
class GhazaliatHafezStart extends GhazaliatHafezEvent{}
class InisialEvent extends GhazaliatHafezStart{}
class LoadedEvent extends GhazaliatHafezStart{}
class LoadMoreEvent extends GhazaliatHafezStart {}

class ItemSelectedEvent  extends GhazaliatHafezStart {
   final int selectedItemId;
   final int selectedPoemId;
   
  ItemSelectedEvent(this.selectedItemId,this.selectedPoemId);
}
