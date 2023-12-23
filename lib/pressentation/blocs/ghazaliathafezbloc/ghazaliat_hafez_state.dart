
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:equatable/equatable.dart';

abstract class GhazaliatHafezState{}
class GhazaliatHafezInitialState extends GhazaliatHafezState{
  GhazaliatHafezInitialState();
}
class GhazaliatHafezLoadingState extends GhazaliatHafezState{

}

class GhazaliatHafezErrorState extends GhazaliatHafezState{
 final String errorText;
  GhazaliatHafezErrorState( this.errorText);
}

class GhazaliatHafezSuccesState extends GhazaliatHafezState{
  final List<GhazalItemModelEntity> ghazaliatHafez;
  GhazaliatHafezSuccesState(this.ghazaliatHafez);
}
class GhazaliatHafezLoadMoreState extends GhazaliatHafezState{

}

class UpdatedCategoryState extends GhazaliatHafezState {
  final bool isHeartIcon;
  UpdatedCategoryState(this.isHeartIcon);

}

class GhazaliatHafezToggleState extends GhazaliatHafezState {
  final bool isHeartSelected;

   GhazaliatHafezToggleState(this.isHeartSelected);
}

class postLoadMoreState extends GhazaliatHafezState{
 
}

class GhazaliatHafezEndOfListState extends GhazaliatHafezState {}

class ItemSelectedState extends GhazaliatHafezState {
  final int selectedItemId;
  ItemSelectedState(this.selectedItemId);
}

