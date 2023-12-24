
import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';

abstract class DetailsGhazaliatHafezState{}

class DetailsGhazaliatHafezInitialState extends DetailsGhazaliatHafezState{
  DetailsGhazaliatHafezInitialState();
}
class DetailsGhazaliatHafezLoadingState extends DetailsGhazaliatHafezState{
}

class DetailsGhazaliatHafezErrorState extends DetailsGhazaliatHafezState{
 final String error;
  DetailsGhazaliatHafezErrorState(this.error);
}

class DetailsGhazaliatHafezSuccesState extends DetailsGhazaliatHafezState{
 final List<DetailsGhazaliatHafezModel> detailsghazaliatHafez;
 final List<GhazalItemModelEntity> gdetailsghazaliatHafez;
  DetailsGhazaliatHafezSuccesState(this.detailsghazaliatHafez,this.gdetailsghazaliatHafez);
}