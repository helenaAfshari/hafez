
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';

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
  GhazaliatHafezSuccesState(this.ghazaliatHafez,);
}









