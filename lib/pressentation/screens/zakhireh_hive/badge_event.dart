
import 'dart:ui';

import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:equatable/equatable.dart';

abstract class BadgeEvent extends Equatable {}

class BadgeLoadEvent extends BadgeEvent {
  // BadgeLoadEvent(this.id);
  
  //int id;
  @override
  List<Object?> get props => [];
}

class BadgeErrorEvent extends BadgeEvent {
  @override
  List<Object?> get props => [];
}

class BageEditedEvent extends BadgeEvent {
  final FavoriteModel character;
  final int index;
  BageEditedEvent({required this.character, required this.index});
  @override
  List<Object?> get props => [index, character];
}

class ChangeeeTabEvent extends BadgeEvent {
  final int selectedIndex;
  ChangeeeTabEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

// class ChangeColorButtomListClickedEvent extends BadgeEvent {
//   ChangeColorButtomListClickedEvent(this.index, this.character,);
//    final FavoriteModel character;
//    int index ;
//   @override
//   List<Object?> get props => [index,];
// }
final class ChangeColorButtomListClickedEvent extends BadgeEvent {
  ChangeColorButtomListClickedEvent( {required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}


