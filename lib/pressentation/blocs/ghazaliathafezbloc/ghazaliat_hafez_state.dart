
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:equatable/equatable.dart';

abstract class GhazaliatHafezState extends Equatable {}

class GhazaliatHafezInitial extends GhazaliatHafezState{
  GhazaliatHafezInitial();
  @override
  List<Object?> get props => [];
}
class GhazaliatHafezLoading extends GhazaliatHafezState{
  @override
  List<Object?> get props => [];
}

class GhazaliatHafezError extends GhazaliatHafezState{
 final String errorText;
  GhazaliatHafezError({required this.errorText});
  @override
  List<Object?> get props => [];
}

class GhazaliatHafezSucces extends GhazaliatHafezState{
  List<GhazaliatHafezModel>ghazalHafezList = [];
  @override
  List<Object?> get props => [ghazalHafezList];
}