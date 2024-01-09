
import 'dart:ui';

import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';
abstract class BadgeEvent extends Equatable {}
// ignore: must_be_immutable
class BadgeLoadEvent extends BadgeEvent {
  BadgeLoadEvent(this.id);
  int id;
  @override
  List<Object?> get props => [];
}
class BadgeErrorEvent extends BadgeEvent {
  @override
  List<Object?> get props => [];
}
final class ChangeColorButtomListClickedEvent extends BadgeEvent {
  ChangeColorButtomListClickedEvent( {required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}


