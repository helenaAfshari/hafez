


import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent,GhazaliatHafezState>{

 GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {
   on<GhazaliatHafezEvent>((event, emit) async {
    if(event is LoadedEvent){
      try{
        emit(GhazaliatHafezLoadingState());
      final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(event.page,event.perPage);
      if(ghazaliatResponse.statusCode == 200){
      // emit(GhazaliatHafezSuccesState());
        List<GhazaliatHafez> ghazaliatDataList = List.from(ghazaliatResponse.data);
  emit(GhazaliatHafezSuccesState(ghazaliatDataList));
          // ارسال دستور به UI با اطلاعات مورد نظر
         // emit(GhazaliatHafezSuccessState(ghazaliatData));
      }else if(ghazaliatResponse.statusCode != 200){
      emit(GhazaliatHafezErrorState("معتبر نیست"));
      }
      }catch(e){
       GhazaliatHafezErrorState("دسترسی به اینترنت قطع شده است");
      }
    //   try{
    //    final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(event.page,event.perPage);
    //  if(ghazaliatResponse.statusCode == 200){
    //   print("ذریافت شد statuseCode200");
    //   List<GhazaliatHafezModel> ghazaliatHafezList =[];
    //   emit(GhazaliatHafezSuccesState(ghazaliatHafezList));

    //  }else if(ghazaliatResponse.statusCode != 200){
    //    print("معتبر نیست");
    //    emit(GhazaliatHafezErrorState( "معتبر نیست"));
    //  }
    //   }catch(e){
    //     print(e);
    //     emit(GhazaliatHafezErrorState( "معتبر نیست"));
    //   }  
    }
   });
}
}








// class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent,GhazaliatHafezState>{
//   List<GhazaliatHafezModel> ghazaliatData = [];
//   //این عدد به هر لود بدیم  عددشو که بعدش صفحه بعدی را برای ما بیاره 
//   int _perPageNumber = 0;
//   int _PageNumber = 0;
//   //GhazaliatHafezRepository postRepository= GhazaliatHafezRepository();
//  final ghazaliatResponse =  serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(0,0);
//   GhazaliatHafezBloc(): super(GhazaliatHafezInitialState()){
//   on<InitialLoadEvent>(_loadInisialData);
//   on<LoadMoreEvent>(_loadMoreEvent);
// }

//    _loadInisialData(InitialLoadEvent event, Emitter<GhazaliatHafezState> emit)async {
//     emit(GhazaliatHafezLoadingState());
//   try{
//     final response =await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(_perPageNumber,_PageNumber);
//     if(response.statusCode == 200){
//       List<dynamic> rowData = response.data;
      
//       ghazaliatData = 
//       rowData.map((e) => GhazaliatHafezModel.fromJason(e)).toList();
//       emit(GhazaliatHafezSuccesState(ghazaliatData));
//     }
//   }catch(e){
//    emit(GhazaliatHafezErrorState(e.toString()));

//      }
//   }
// _loadMoreEvent(LoadMoreEvent event, Emitter<GhazaliatHafezState> emit)async {
//     _perPageNumber++;
//     _PageNumber++;
//       emit(GhazaliatHafezLoadMoreState());
//   try{
//     final response =await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(_perPageNumber,_PageNumber);
//     if(response.statusCode == 200){
//       List<dynamic> rowData = response.data;
      
//      List<GhazaliatHafezModel> loadedData= 
//       rowData.map((e) => GhazaliatHafezModel.fromJason(e)).toList();
//       //اینجا اینو نوشتیم که لیست به اخرش رسید addکنیم بعد از نمایش لودینگ دوباره دیتا بیلد
//       ghazaliatData.addAll(loadedData);
//       emit(GhazaliatHafezSuccesState(ghazaliatData));
//     }
//   }catch(e){
//    emit(GhazaliatHafezErrorState(e.toString()));

//      }
//   }
// }