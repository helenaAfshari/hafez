
import 'dart:ui';

import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';
abstract class BadgeEvent {}
// ignore: must_be_immutable
class BadgeLoadEvent extends BadgeEvent {
  // BadgeLoadEvent(this.ids);
  //  final List<int> ids;
}
class BadgeErrorEvent extends BadgeEvent {
 
}
final class ChangeColorButtomListClickedEvent extends BadgeEvent {
  ChangeColorButtomListClickedEvent( {required this.id});
  final int id;

}
class LoadMoreBadgeEvent extends BadgeEvent {
 
}


