
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{}

class HomeInitial extends HomeState{
  HomeInitial();
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState{
 final String errorText;
  HomeError({required this.errorText});
  @override
  List<Object?> get props => [errorText];
}

class HomeSuccess extends HomeState{
  @override
  List<Object?> get props => [];

}