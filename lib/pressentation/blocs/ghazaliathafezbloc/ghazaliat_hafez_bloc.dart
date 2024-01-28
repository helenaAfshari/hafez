import 'package:hafez/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
  int page = 1;
  int perPage = 50;
  List<GhazalItemModelEntity> ghazaliatHafez = [];

  List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];
  GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {
    on<GhazaliatHafezEvent>((event, emit) async {
      print(event);


      if (event is LoadedEvent) {
        print("kkkkkk");
        //  if(ghazaliatHafez.isEmpty){
        //       print("EmptyyyResponse:::"); 
        //       GhazaliatHafezSuccesStateeeeee(ghazaliatHafez);
        //  }else{
        //   print("hhhhhh");
        //  }
      

        try {
          print("llllll");
          emit(GhazaliatHafezLoadingState());
          final ghazaliatResponse =
              await serviceLocator<GhazaliatHafezRepository>()
                  .ghazaliathafez(page, perPage);
          emit(GhazaliatHafezSuccesState(ghazaliatResponse));
        } 
       catch (e) {
          print("نیست به اینترت");

        }
      
    }
    });
    on<ChangeColorButtomListClickedEventtt>((event, emit) async {
  final currentState = state;
  if (currentState is GhazaliatHafezSuccesState && currentState.ghazaliatHafez.isEmpty) {
    emit(GhazaliatHafezEmptyState(ghazaliatHafez));
    print("inbesxdfr"); // خروج از تابع برای جلوگیری از ادامه اجرای کد
  }

  final todos = List<GhazalItemModelEntity>.from((currentState as GhazaliatHafezSuccesState).ghazaliatHafez);
  final todoIndex = todos.indexWhere((e) => e.id == event.id);
  serviceLocator<GhazaliatHafezRepository>().toggleFav(event.id, todos[todoIndex]);
  final todo = todos[todoIndex];
  todos[todoIndex] = todo.copyWith(isLiked: !(todo.isLiked ?? false));
  emit(GhazaliatHafezSuccesState(todos));
},);

    //  on<ChangeColorButtomListClickedEventtt>((event, emit) async {
    //     final todos = List<GhazalItemModelEntity>.from((state as GhazaliatHafezSuccesState).ghazaliatHafez);
    //     final todoIndex = todos.indexWhere((e) => e.id == event.id);
    //           serviceLocator<GhazaliatHafezRepository>()
    //               .toggleFav(event.id, todos[todoIndex]);
    //       final todo = todos[todoIndex];
    //       todos[todoIndex] = todo.copyWith(isLiked: !(todo.isLiked ?? false));
    //      emit(GhazaliatHafezSuccesState(todos));
    // },);

    on<LoadMoreEvent>((event, emit) async {
      page++;
      

   try {
          print("llllllTooogglllee");
          final ghazaliatResponse =
              await serviceLocator<GhazaliatHafezRepository>()
                  .ghazaliathafez(page, perPage);
  emit(GhazaliatHafezSuccesState(ghazaliatResponse));
        }  catch (e) {
        print(" 77777متصل نیست به اینترنت");
      }
        });
  }
}
