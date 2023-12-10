
import 'package:autharization_hanna/pressentation/blocs/home_bloc/event_home.dart';
import 'package:autharization_hanna/pressentation/blocs/home_bloc/state_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeInitial()) {
  on<HomeEvent>((event, emit)async {
     if(event is ghazaliatHafezButtonClicked){
       
     }
  },);
  }
}