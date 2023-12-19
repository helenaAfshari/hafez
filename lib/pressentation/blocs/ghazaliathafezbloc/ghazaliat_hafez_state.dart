
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:equatable/equatable.dart';

abstract class GhazaliatHafezState extends Equatable{}
class GhazaliatHafezInitialState extends GhazaliatHafezState{
  GhazaliatHafezInitialState();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GhazaliatHafezLoadingState extends GhazaliatHafezState{
  @override
  List<Object?> get props => [];
}

class GhazaliatHafezErrorState extends GhazaliatHafezState{
 final String errorText;
  GhazaliatHafezErrorState( this.errorText);
  
  @override
  // TODO: implement props
  List<Object?> get props => [errorText];
}

class GhazaliatHafezSuccesState extends GhazaliatHafezState{
  final List<GhazalItemModelEntity> ghazaliatHafez;
  GhazaliatHafezSuccesState(this.ghazaliatHafez);
  @override
  List<Object?> get props => [ghazaliatHafez];
}

//ما میخواییم کل صفحه در لودینگ نره فقط پایینش لود بشه مثل اینستاگرام
class GhazaliatHafezLoadMoreState extends GhazaliatHafezState{
  @override
  List<Object?> get props => [];
}

class UpdatedCategoryState extends GhazaliatHafezState {
  final bool isHeartIcon;
  UpdatedCategoryState(this.isHeartIcon);
  @override
  List<Object> get props => [isHeartIcon];
}

class GhazaliatHafezToggleState extends GhazaliatHafezState {
  final bool isHeartSelected;

   GhazaliatHafezToggleState(this.isHeartSelected);

  @override
  List<Object?> get props => [isHeartSelected];
}

class postLoadMoreState extends GhazaliatHafezState{
  @override
  List<Object?> get props => [];
}

class GhazaliatHafezEndOfListState extends GhazaliatHafezState {
  final String message;

  GhazaliatHafezEndOfListState({required this.message});

  @override
  List<Object> get props => [message];
}
