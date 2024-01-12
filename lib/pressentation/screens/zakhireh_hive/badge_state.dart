
import 'dart:ui';
import 'package:autharization_hanna/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BadgeState extends Equatable{
}
class BadgeInitialState extends BadgeState{
  @override
  List<Object?> get props => [];
}
class BadgeLoading extends BadgeState{
  @override
  List<Object?> get props =>[];
}
class BadgeLoadedState extends BadgeState{
  BadgeLoadedState(this.fcharacters);
   final List<GhazalItemModelEntity> fcharacters;
  //  final List<GhazalItemModelEntity> characters;
  @override
  List<Object?> get props => [fcharacters];
}
class BadgeErrorState extends BadgeState{
   BadgeErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [];
}


