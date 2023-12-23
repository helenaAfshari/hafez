
abstract class DetailsGhazaliatHafezState{}

class DetailsGhazaliatHafezInitialState extends DetailsGhazaliatHafezState{
  DetailsGhazaliatHafezInitialState();
}
class DetailsGhazaliatHafezLoadingState extends DetailsGhazaliatHafezState{
}

class DetailsGhazaliatHafezErrorState extends DetailsGhazaliatHafezState{
 final String errorText;
  DetailsGhazaliatHafezErrorState( this.errorText);
}

class DetailsGhazaliatHafezSuccesState extends DetailsGhazaliatHafezState{
 // final List<GhazalItemModelEntity> ghazaliatHafez;
  DetailsGhazaliatHafezSuccesState();
}