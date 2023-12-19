import 'dart:async';

import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent,GhazaliatHafezState>{

//  GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {

//    on<GhazaliatHafezEvent>((event, emit) async {
//     if(event is LoadedEvent){
//       try{
//         emit(GhazaliatHafezLoadingState());
//       final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(event.page,event.perPage);
//       if(ghazaliatResponse.statusCode == 200){
//       // emit(GhazaliatHafezSuccesState());
//         //List<GhazaliatHafez> ghazaliatDataList = List.from(ghazaliatResponse.data);
//          emit(GhazaliatHafezSuccesState(event.ghazaliatHafez));
//           // ارسال دستور به UI با اطلاعات مورد نظر
//          // emit(GhazaliatHafezSuccessState(ghazaliatData));
//       }else if(ghazaliatResponse.statusCode != 200){
//       emit(GhazaliatHafezErrorState("معتبر نیست"));
//       }
//       }catch(e){
//        GhazaliatHafezErrorState("دسترسی به اینترنت قطع شده است");
//       }
//     //   try{
//     //    final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(event.page,event.perPage);
//     //  if(ghazaliatResponse.statusCode == 200){
//     //   print("ذریافت شد statuseCode200");
//     //   List<GhazaliatHafezModel> ghazaliatHafezList =[];
//     //   emit(GhazaliatHafezSuccesState(ghazaliatHafezList));

//     //  }else if(ghazaliatResponse.statusCode != 200){
//     //    print("معتبر نیست");
//     //    emit(GhazaliatHafezErrorState( "معتبر نیست"));
//     //  }
//     //   }catch(e){
//     //     print(e);
//     //     emit(GhazaliatHafezErrorState( "معتبر نیست"));
//     //   }
//     }
//    }
//    );
// }
// }

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
     int page =0;
     int perPage=1;

      List<GhazalItemModelEntity> ghazaliatHafez = [];
  GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {
    //on<GhazaliatHafezEvent>(_loadInisialData);
    on<GhazaliatHafezEvent>((event, emit) async {
      // int page = 2;
      // int perPage = 3;
//List<GhazaliatHafez> ghazaliatHafez =[] ;
      
      print(event);
      if (event is LoadedEvent) {
        print("kkkkkk");
        try {
          print("llllll");
          emit(GhazaliatHafezLoadingState());
          final ghazaliatResponse =
              await serviceLocator<GhazaliatHafezRepository>()
                  .ghazaliathafez(page,perPage);
          print("jjjjj${ghazaliatResponse}");
          ghazaliatHafez = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
          if (ghazaliatResponse.statusCode == 200) {
            // فرض بر این است که متد ghazaliathafez یک لیست از نوع GhazaliatHafez را برمی‌گرداند
            // ghazaliatHafez = ghazaliatResponse.data; // این خط را بر اساس ساختار واقعی پاسخ API تغییر دهید
            print("55555555");
            emit(GhazaliatHafezSuccesState(ghazaliatHafez));
            print("kooooooooo${ghazaliatHafez}");
          } else {
            emit(GhazaliatHafezErrorState("معتبر نیست"));
          }
        } catch (e) {
          // ignore: deprecated_member_use
          print(" متصل نیست به اینترت");
          } 
        }
    //     else if (event is ToggleIconEvent) {
    //   // Toggle the icon or any other state
    //   final currentState = state;

    //   if (currentState is GhazaliatHafezSuccesState) {
    //     final updatedState = GhazaliatHafezSuccesState(
    //       currentState.ghazaliatHafez,
    //       isIconToggled: !currentState.isIconToggled,
    //     );
    //     yield updatedState;
    //   }
    // }
      });
    //    on<LoadMoreEvent>((event, emit) async {
    //       List<GhazalItemModelEntity> loadedData = [];
    //     page++;
    //     perPage++;
    //        print(event);
    //   if (event is LoadMoreEvent) {
    //     print("kkkkkk");
    //     try {
    //       print("llllll");
    //       emit(postLoadMoreState());
    //       final ghazaliatResponse =
    //           await serviceLocator<GhazaliatHafezRepository>()
    //               .ghazaliathafez(page,perPage);
    //       print("jjjjj${ghazaliatResponse}");

    //       loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
    //     ghazaliatHafez.addAll(loadedData);
    //       if (ghazaliatResponse.statusCode == 200) {
    //         // فرض بر این است که متد ghazaliathafez یک لیست از نوع GhazaliatHafez را برمی‌گرداند
    //         // ghazaliatHafez = ghazaliatResponse.data; // این خط را بر اساس ساختار واقعی پاسخ API تغییر دهید
    //         print("55555555");
    //         emit(GhazaliatHafezSuccesState(ghazaliatHafez));
    //         print("kooooooooo${ghazaliatHafez}");
    //       } else {
    //         emit(GhazaliatHafezErrorState("معتبر نیست"));
    //       }
    //     } catch (e) {
    //       // ignore: deprecated_member_use
    //       print(" متصل نیست به اینترت");
    //       } 
    //     }
    //    });

    // }

   on<LoadMoreEvent>((event, emit) async {
   String message;
   List<GhazalItemModelEntity> loadedData = [];
  page++;
  perPage++;

  if (event is LoadMoreEvent) {
    try {
      emit(postLoadMoreState());
      final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>()
          .ghazaliathafez(page, perPage);

      print("jjjjj${ghazaliatResponse}");

      loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
      ghazaliatHafez.addAll(loadedData);

      if (loadedData.isEmpty) {
        // داده جدیدی برای لود وجود ندارد، بنابراین می‌توانید فرض کنید به انتهای لیست رسیده‌اید
        emit(GhazaliatHafezEndOfListState(message: "ffffff"));
      } else {
        if (ghazaliatResponse.statusCode == 200) {
          emit(GhazaliatHafezSuccesState(ghazaliatHafez));
          print("kooooooooo${ghazaliatHafez}");
        } else {
          emit(GhazaliatHafezErrorState("معتبر نیست"));
        }
      }
    } catch (e) {
      // ignore: deprecated_member_use
      print(" متصل نیست به اینترنت");
    }
  }
});
}
  // @override
  // Stream<GhazaliatHafezState> mapEventToState(GhazaliatHafezEvent event) async* {
  //   if (event is LoadMoreEvent) {
  //     yield GhazaliatHafezLoading();

  //     try {
  //       final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(page, perPage);
  //       final loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

  //       ghazaliatHafez.addAll(loadedData);

  //       if (loadedData.isEmpty) {
  //         // داده جدیدی برای لود وجود ندارد، بنابراین می‌توانید فرض کنید به انتهای لیست رسیده‌اید
  //         yield GhazaliatHafezEndOfList(message: "ffffff");
  //       } else {
  //         if (ghazaliatResponse.statusCode == 200) {
  //           yield GhazaliatHafezSucces(ghazaliatHafez);
  //         } else {
  //           yield GhazaliatHafezError("معتبر نیست");
  //         }
  //       }
  //     } catch (e) {
  //       // ignore: deprecated_member_use
  //       print("متصل نیست به اینترنت");
  //     }
  //   }
  // }
}

  
//   _loadInisialData(GhazaliatHafezEvent event, Emitter<GhazaliatHafezState> emit) async {
//     emit(GhazaliatHafezLoadingState());
//      int page = 2;
//       int perPage = 3;
// //List<GhazaliatHafez> ghazaliatHafez =[] ;
//       List<GhazalItemModelEntity> ghazaliatHafez = [];
//       print(event);
//       if (event is LoadedEvent) {
        
//         print("kkkkkk");
//         try {
//           print("llllll");
//           emit(GhazaliatHafezLoadingState());
//           final ghazaliatResponse =
//               await serviceLocator<GhazaliatHafezRepository>()
//                   .ghazaliathafez(page, perPage);
//           print("jjjjj${ghazaliatResponse}");
//           ghazaliatHafez = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

//           if (ghazaliatResponse.statusCode == 200) {
//             // فرض بر این است که متد ghazaliathafez یک لیست از نوع GhazaliatHafez را برمی‌گرداند
//             // ghazaliatHafez = ghazaliatResponse.data; // این خط را بر اساس ساختار واقعی پاسخ API تغییر دهید
//             print("55555555");
//             emit(GhazaliatHafezSuccesState(ghazaliatHafez));
//             print("kooooooooo${ghazaliatHafez}");
//           } else {
//             emit(GhazaliatHafezErrorState("معتبر نیست"));
//           }
//         } catch (e) {
//           // ignore: deprecated_member_use
//           print(" متصل نیست به اینترت");
//           } 
//         }
//   }


////////////////////////

// BLoC
// class GhazaliatHafezBloc
//     extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
//   GhazaliatHafezBloc() : super(GhazaliatHafezInitialState());

//   @override
//   Stream<GhazaliatHafezState> mapEventToState(
//       GhazaliatHafezEvent event) async* {
//     if (event is LoadedEvent) {
//       // Handle the loaded event
//       // Emit the appropriate state
//     } else if (event is ToggleIconEvent) {
//       // Toggle the icon or any other state
//       final currentState = state;

//       if (currentState is GhazaliatHafezSuccesState) {
//         final updatedState = GhazaliatHafezSuccesState(
//           currentState.ghazaliatHafez,
//           isIconToggled: !currentState.isIconToggled,
//         );
//         yield updatedState;
//       }
//     }
//   }
// }






// class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent,GhazaliatHafezState>{

//  GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {

//    on<GhazaliatHafezEvent>((event, emit) async {
//     if(event is LoadedEvent){
//       try{
//         emit(GhazaliatHafezLoadingState());
//       final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>().ghazaliathafez(event.page,event.perPage);
//       if(ghazaliatResponse.statusCode == 200){
//       // emit(GhazaliatHafezSuccesState());
//         //List<GhazaliatHafez> ghazaliatDataList = List.from(ghazaliatResponse.data);
//          emit(GhazaliatHafezSuccesState(event.ghazaliatHafez));
//           // ارسال دستور به UI با اطلاعات مورد نظر
//          // emit(GhazaliatHafezSuccessState(ghazaliatData));
//       }else if(ghazaliatResponse.statusCode != 200){
//       emit(GhazaliatHafezErrorState("معتبر نیست"));
//       }
//       }catch(e){
//        GhazaliatHafezErrorState("دسترسی به اینترنت قطع شده است");
//       }}
//       });

//       }
//       }
