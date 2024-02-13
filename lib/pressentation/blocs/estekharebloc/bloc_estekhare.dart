import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/domain/repository/estekharerepo/estekhare_repository.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/state_estekhare.dart';
import 'package:hafez/service_locator.dart';

class BlocEstekhare extends Bloc<EstekhareEvent, StekharehState> {
  List<GhazalItemModelEntity> ghazaliatHafez = [];
  BlocEstekhare() : super(InisialEstekhareState()) {
    on<EstekhareEvent>((event, emit) async {
      print(event);
      if (event is EstekhareLoadedEvent) {
        print("kkkkkk");
        try {
          print("llllll");
          emit(LoadingEstekhareState());
          final detailsGhazaliatResponse =
              await serviceLocator<EstekhareRepository>().estekhareRepository(
                  nextNumber(index: event.selectEstekhareId));
          print("EEEEEEEEEEETTTTTTTT${detailsGhazaliatResponse}");

          ghazaliatHafez = (detailsGhazaliatResponse.data['data'] as List)
              .map((e) => GhazalItemModelEntity.fromJson(e))
              .toList();
          if (detailsGhazaliatResponse.statusCode == 200) {
            print("llllllHHHHHTTTYYYYYYY$ghazaliatHafez");
            emit(SuccesEstekhareState(
              ghazaliatHafez,
            ));
            print("Estekhareh${ghazaliatHafez}");
          } else {
            emit(ErrorEstekhareState("not Valid"));
          }
        } catch (e) {
          print("have not interner");
        }
      }
    });
  }
  int nextNumber({required int index}) => Random().nextInt(index);
}


