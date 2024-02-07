
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/domain/repository/estekharerepo/estekhare_repository.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/state_estekhare.dart';
import 'package:hafez/pressentation/screens/estekhare/estekhare_screen.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter/material.dart';

class BlocEstekhare extends Bloc<EstekhareEvent,StekharehState>{
  List<GhazalItemModelEntity> ghazaliatHafez = [];
  
  // int page = 1;
  // int perPage = 50;
  BlocEstekhare() :super(InisialEstekhareState()){

 on<EstekhareEvent>((event, emit) async {
      print(event);
      if (event is EstekhareLoadedEvent) {
        print("kkkkkk");
    try {
    print("llllll");
    emit(LoadingEstekhareState());

    final detailsGhazaliatResponse =
      await serviceLocator<EstekhareRepository>().estekhareRepository(
        
        nextNumber(index: event.selectEstekhareId)
        
        );
   print("EEEEEEEEEEETTTTTTTT${detailsGhazaliatResponse}");

     ghazaliatHafez = (detailsGhazaliatResponse.data['data'] as List).map((e) =>
     GhazalItemModelEntity.fromJson(e)).toList();
    
    if (detailsGhazaliatResponse.statusCode == 200) {
            print("llllllHHHHHTTTYYYYYYY$ghazaliatHafez");
            emit(SuccesEstekhareState(ghazaliatHafez,));
    

            print("Estekhareh${ghazaliatHafez}");
          } else {
            emit(ErrorEstekhareState("معتبر نیست"));
          }
} 
catch (e) {
    print("نیست به اینترت");
}
    }
 }
 );

  }
   int nextNumber({required int index}) => Random().nextInt(index);
}


//   class BlocEstekhare extends Bloc<EstekhareEvent,StekharehState>{
//  // List<GhazalItemModelEntity> ghazaliatHafez = [];
//   // int page = 1;
//   // int perPage = 50;
//   BlocEstekhare() :super(InisialEstekhareState()){

//  on<EstekhareEvent>((event, emit) async {
//       print(event);
//       if (event is EstekhareLoadedEvent) {
//         print("kkkkkk");
//     try {
//     print("llllll");
//     emit(LoadingEstekhareState());
//     final ghazaliatResponse =
//         await serviceLocator<GhazaliatHafezRepository>()
//             .ghazaliathafez(0, 100);
//       // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
//     emit(SuccesEstekhareState(ghazaliatResponse,));
// } 
// catch (e) {




// class BlocHelena extends Bloc<EstekhareEvent,StekharehState>{
//  // List<GhazalItemModelEntity> ghazaliatHafez = [];
//   // int page = 1;
//   // int perPage = 50;
//   BlocHelena() :super(InisialEstekhareState()){

//  on<EstekhareEvent>((event, emit) async {
//       print(event);
//       if (event is EstekhareLoadedEvent) {
//         print("kkkkkk");
//     try {
//     print("llllll");
//     emit(LoadingEstekhareState());
//     final ghazaliatResponse =
//         await serviceLocator<GhazaliatHafezRepository>()
//             .ghazaliathafez(0, 90);
//       // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
//     emit(SuccesEstekhareState(ghazaliatResponse,));
// } 
// catch (e) {
//     print("نیست به اینترت");
// }
//     }
//  });
//   }
// }
//  on<ChangeTab>((event, emit)async {
//  emit(ClickedState(event.e));
//       try {
//           print("llllllTooogglllee");
//           final ghazaliatResponse =
//               await serviceLocator<GhazaliatHafezRepository>()
//                   .ghazaliathafez(51, 100);
//   emit(SuccesEstekhareState(ghazaliatResponse));
//         }  catch (e) {
//         print(" 77777متصل نیست به اینترنت");
//       }
//  },);

//  class YourBloc extends Bloc<YourEvent, YourState> {
//   YourBloc() : super(YourInitialState());

//   final _random = Random();

//   @override
//   Stream<YourState> mapEventToState(YourEvent event) async* {
//     if (event is YourEvent) {
//       final randomNumber = nextNumber(index: event.index);
//       yield YourState(randomNumber);
//     }
//   }

//   int nextNumber({required int index}) => _random.nextInt(index);
// }

 
//   on<ClickedEvent>((event, emit)  {
//      emit(ClickedState(event.clic?true:false));
// });
//  on<ClickedEvent>((event, emit) async {
//       print(event);
     
//      //emit(ClickedState());
//         print("kkkkkk");
//     try {
//     print("llllll");
//     emit(LoadingEstekhareState());
//     final ghazaliatResponse =
//         await serviceLocator<GhazaliatHafezRepository>()
//             .ghazaliathafez(50, 150);
               
//       // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
//     emit(SuccesEstekhareState(ghazaliatResponse));
// } 
// catch (e) {
//     print("نیست به اینترت");
// }
  

//  });
    
// on<ClickedEvent>((event, emit) async {
//   print(event);
//   print("22222");

//     emit(ClickedState(event.clic));
   
//    print("object");
//   try {
//     print("llllll");
//     emit(LoadingEstekhareState());
//     final ghazaliatResponse =
//         await serviceLocator<GhazaliatHafezRepository>()
//             .ghazaliathafez(50, 150);
//              // emit(ClickedState(event.clic));
//     emit(SuccesEstekhareState(ghazaliatResponse));
//   } catch (e) {
//     print("نیست به اینترت");
//   }
  
 
// });
  //  if (event is ClickedEvent) {
  //     // در اینجا وضعیت بر اساس مقدار clic تغییر می‌کند
  //     yield SuccessEstekhareState(event.clic);
  //     try {
  //       yield LoadingEstekhareState();
  //       final ghazaliatResponse =
  //           await serviceLocator<GhazaliatHafezRepository>()
  //               .ghazaliathafez(50, 150);
  //       yield SuccessEstekhareState(ghazaliatResponse);
  //     } catch (e) {
  //       yield FailureEstekhareState("نیست به اینترنت");
  //     }
  //   }
  // }


   
   
    // on<ClickedEvent>((event, emit) async {
    //     if (event is EstekhareLoadedEvent) {
    //           try{
    //      emit(LoadingEstekhareState());
    //       final ghazaliatResponse =
    //           await serviceLocator<GhazaliatHafezRepository>()
    //               .ghazaliathafez(51, 100);
    //           // Random().nextInt(event.id); 
    //       emit(ClickedEstekhareState(ghazaliatResponse));
    //    }catch(e){
    //       print("Estekhareh Catch");
    //    }
    //     }
    // },);
    // on<ClickedEvent>((event, emit) {
    //   if(event is )
    // },);
  //  on<EstekhareEvent>((event, emit) async {
  //    if (event is EstekhareLoadedEvent)
  //    {
  // print("Estekhareh");
  //  try{
  //   print("kklllgEst");
  //    emit(LoadingEstekhareState());
     
  //     final estekhareResponse =
  //             await serviceLocator<EstekhareRepository>()
  //                 .estekhareRepository(event.selectEstekhareId);
  //                  ghazaliatHafez = (estekhareResponse.data['data'] as List).map((e) =>
  //          GhazalItemModelEntity.fromJson(e)).toList();
  //                 if (estekhareResponse.statusCode == 200) {
  //           print("777777");
  //           emit(SuccesEstekhareState(ghazaliatHafez));
  //           print("koohhhhho${ghazaliatHafez}");
  //         } else {
  //           emit(ErrorEstekhareState("معتبر نیست"));
  //         }
  //  }catch(e){
  // print("EstekharehError");
  //  }
  //    }
  //  },);





// class BlocEstekharee extends Bloc<sssssEvent,SsssssssState>{
//  // List<GhazalItemModelEntity> ghazaliatHafez = [];
   
//   // int page = 1;
//   // int perPage = 50;
//   BlocEstekharee() :super(ssssssssssState()){
//  on<sssssEvent>((event, emit) async {
//       print(event);
//       if (event is sssssssLoadedEvent) {
//         print("kkkkkk");
//     try {
//     print("llllll");
//     emit(LoadingssssssssssseState());
//     final ghazaliatResponse =
//         await serviceLocator<GhazaliatHafezRepository>()
//             .ghazaliathafez(60, 150);
//               // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
//     emit(SuccessssssssssssState(ghazaliatResponse,));
  
// } 
// catch (e) {
//     print("نیست به اینترت");
// }
//     }
// //     if(event is EstekhareLoadedEventt){
// //              print("kkkllll;;jjh");
// //     try {
// //     print("llllll");
// //     emit(LoadingEstekhareState());
// //               final k =
// //         await serviceLocator<GhazaliatHafezRepository>()
// //             .ghazaliathafez(50, 100);
// //               emit(SuccesEstekhareStatee(k,));
// //       // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
  
// // } catch(e){
// //   print("hhhhfff");
// // }
// //     }

//  });


// //  class YourBloc extends Bloc<YourEvent, YourState> {
// //   YourBloc() : super(YourInitialState());

// //   final _random = Random();

// //   @override
// //   Stream<YourState> mapEventToState(YourEvent event) async* {
// //     if (event is YourEvent) {
// //       final randomNumber = nextNumber(index: event.index);
// //       yield YourState(randomNumber);
// //     }
// //   }

// //   int nextNumber({required int index}) => _random.nextInt(index);
// // }

 
// //   on<ClickedEvent>((event, emit)  {
// //      emit(ClickedState(event.clic?true:false));
// // });
// //  on<ClickedEvent>((event, emit) async {
// //       print(event);
     
// //      //emit(ClickedState());
// //         print("kkkkkk");
// //     try {
// //     print("llllll");
// //     emit(LoadingEstekhareState());
// //     final ghazaliatResponse =
// //         await serviceLocator<GhazaliatHafezRepository>()
// //             .ghazaliathafez(50, 150);
               
// //       // Random().nextInt(event.selectEstekhareId); // اینجا اضافه شده است
// //     emit(SuccesEstekhareState(ghazaliatResponse));
// // } 
// // catch (e) {
// //     print("نیست به اینترت");
// // }
  

// //  });
    
// // on<ClickedEvent>((event, emit) async {
// //   print(event);
// //   print("22222");

// //     emit(ClickedState(event.clic));
   
// //    print("object");
// //   try {
// //     print("llllll");
// //     emit(LoadingEstekhareState());
// //     final ghazaliatResponse =
// //         await serviceLocator<GhazaliatHafezRepository>()
// //             .ghazaliathafez(50, 150);
// //              // emit(ClickedState(event.clic));
// //     emit(SuccesEstekhareState(ghazaliatResponse));
// //   } catch (e) {
// //     print("نیست به اینترت");
// //   }
  
 
// // });
//   //  if (event is ClickedEvent) {
//   //     // در اینجا وضعیت بر اساس مقدار clic تغییر می‌کند
//   //     yield SuccessEstekhareState(event.clic);
//   //     try {
//   //       yield LoadingEstekhareState();
//   //       final ghazaliatResponse =
//   //           await serviceLocator<GhazaliatHafezRepository>()
//   //               .ghazaliathafez(50, 150);
//   //       yield SuccessEstekhareState(ghazaliatResponse);
//   //     } catch (e) {
//   //       yield FailureEstekhareState("نیست به اینترنت");
//   //     }
//   //   }
//   // }


   
   
//     // on<ClickedEvent>((event, emit) async {
//     //     if (event is EstekhareLoadedEvent) {
//     //           try{
//     //      emit(LoadingEstekhareState());
//     //       final ghazaliatResponse =
//     //           await serviceLocator<GhazaliatHafezRepository>()
//     //               .ghazaliathafez(51, 100);
//     //           // Random().nextInt(event.id); 
//     //       emit(ClickedEstekhareState(ghazaliatResponse));
//     //    }catch(e){
//     //       print("Estekhareh Catch");
//     //    }
//     //     }
//     // },);
//     // on<ClickedEvent>((event, emit) {
//     //   if(event is )
//     // },);
//   //  on<EstekhareEvent>((event, emit) async {
//   //    if (event is EstekhareLoadedEvent)
//   //    {
//   // print("Estekhareh");
//   //  try{
//   //   print("kklllgEst");
//   //    emit(LoadingEstekhareState());
     
//   //     final estekhareResponse =
//   //             await serviceLocator<EstekhareRepository>()
//   //                 .estekhareRepository(event.selectEstekhareId);
//   //                  ghazaliatHafez = (estekhareResponse.data['data'] as List).map((e) =>
//   //          GhazalItemModelEntity.fromJson(e)).toList();
//   //                 if (estekhareResponse.statusCode == 200) {
//   //           print("777777");
//   //           emit(SuccesEstekhareState(ghazaliatHafez));
//   //           print("koohhhhho${ghazaliatHafez}");
//   //         } else {
//   //           emit(ErrorEstekhareState("معتبر نیست"));
//   //         }
//   //  }catch(e){
//   // print("EstekharehError");
//   //  }
//   //    }
//   //  },);
//   }

// }

// class ColorBloc extends Bloc<ClickEvent, ColorState> {
//   ColorBloc(ColorState initialState) : super(initialState);
   
//   @override
//   Stream<ColorState> mapEventToState(ClickEvent event) async* {
//     // if (event is Clicked) {
//     //   // تغییر وضعیت رنگ بر اساس وضعیت قبلی
//     //  yield ColorState(isClicked: !state.isClicked);
//     // }
//   }
// }


