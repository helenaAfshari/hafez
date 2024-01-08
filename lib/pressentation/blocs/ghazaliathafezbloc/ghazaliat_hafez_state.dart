
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';

abstract class GhazaliatHafezState{

}
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
  
  //  final bool isHeartSelected;
  GhazaliatHafezSuccesState(this.ghazaliatHafez,);

 // get toggle => false;
}

class GhazaliatHafezChangeState extends GhazaliatHafezState {
  final List<bool> isHeartSelectedList;
  GhazaliatHafezChangeState(this.isHeartSelectedList);
}




