
import 'dart:ui';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BadgeState extends Equatable{
}

class BadgeInitial extends BadgeState{
  @override
  List<Object?> get props => [];
}

class BadgeLoading extends BadgeState{
  @override
  List<Object?> get props =>[];

}

class BadgeLoadedState extends BadgeState{
  BadgeLoadedState(this.characters,);
   final List<FavoriteModel> characters;
  
  @override
  List<Object?> get props => [characters];
}

class BadgeErrorState extends BadgeState{
   BadgeErrorState(this.error);
   
  final String error;
  @override
  List<Object?> get props => [];
}

class ChangeColorListState extends BadgeState {
  ChangeColorListState(this.isColor,
 );
  int isColor;
 // bool isFalse;
  @override
  List<Object?> get props => [isColor];
}

