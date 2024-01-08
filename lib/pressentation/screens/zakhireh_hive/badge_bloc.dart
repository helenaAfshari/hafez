
import 'dart:ui';

import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  BadgeBloc({required this.box}) : super(BadgeInitial()) {
  
   GhazalItemModelEntity? ghazaliatHafez;
    on<BadgeLoadedEvent>((event, emit) async {
      emit(BadgeLoading());
      try {
        emit(BadgeLoadedState(await box.getCharacters()));
      } catch (e) {
        emit(BadgeErrorState(e.toString()));
        emit(BadgeInitial());
      }
    });

  on<ChangeColorButtomListClickedEvent>((event, emit) {
  // emit(ChangeColorListState(event.index,event.isFirstTime));
    if (!event.isFirstTime) {
    emit(ChangeColorListState(event.index,));
  }
  
  });

    on<BageEditedEvent>((event, emit) async {
      try {
        box.updateCharacter(event.index, event.character);
        emit(BadgeLoadedState(await box.getCharacters(),));
      } catch (e) {
        emit(BadgeErrorState(e.toString()));
        emit(BadgeInitial());
      }
    });
  }

  final BadgeDatabase box;
    int selectedIndex = 5; // اگر نیاز دارید اینجا selectedIndex را اضافه کنید

}
Color _getButtonColor(BadgeState state, int index, int selectedIndex) {
  print("Current state: $state");
  if (state is BadgeLoadedState) {
    return (index == selectedIndex) ? Colors.blue : Colors.amber;
  } else {
    return Colors.red; // Red color
  }
}