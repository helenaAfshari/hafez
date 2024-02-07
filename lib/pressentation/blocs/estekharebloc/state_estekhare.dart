import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';

abstract class StekharehState {}

class InisialEstekhareState extends StekharehState{

}

class SuccesEstekhareState extends StekharehState{
  // int idddd;
  // int a = Random().nextInt(2);
  SuccesEstekhareState(this.ghazaliatHafezEstekhare,);
   final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
  //final int a;
  }


// class SuccesEstekhareState extends StekharehState {
//   final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;

//   SuccesEstekhareState(this.ghazaliatHafezEstekhare) {
//     // Randomize the list
//     ghazaliatHafezEstekhare.shuffle(Random());
//   }
// }

  class SuccesEstekhareStateTow extends StekharehState{
  SuccesEstekhareStateTow(this.ghazaliatHafezEstekhare);
  final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
  }
  
class LoadingEstekhareState extends StekharehState{

}
class ErrorEstekhareState extends StekharehState{
 final String errorText;
 ErrorEstekhareState(this.errorText);
}

// class ClickedState extends StekharehState {
//   ClickedState({this.Cliiiiccccc=true});
//     // final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
// final  bool Cliiiiccccc;

// }

class ClickedState extends StekharehState {
  ClickedState(this.Cliiiiccccc);
  final bool Cliiiiccccc;
}





// class ColorState {
//   final bool isClicked;

//   ColorState({required this.isClicked});
// }





// class YourWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<YourBloc, YourState>(
//       builder: (context, state) {
//         if (state is YourLoadedState) {
//           return Stack(
//             children: [
//               GestureDetector(
//                 onTapDown: (TapDownDetails details) {
//                   BlocProvider.of<YourBloc>(context).add(YourClickedEvent(details.globalPosition));
//                 },
//                 child: Container(
//                   width: 50,
//                   color: const Color.fromARGB(255, 179, 115, 110),
//                 ),
//               ),
//               if (state.isClicked && state.offset != null)
//                 Positioned(
//                   left: state.offset!.dx - 1,
//                   top: 0,
//                   child: Container(
//                     width: 2,
//                     height: MediaQuery.of(context).size.height,
//                     color: Colors.black,
//                   ),
//                 ),
//             ],
//           );
//         } else {
//           return Container(); // ویجت خالی یا ویجت پیش فرض
//         }
//       },
//     );
//   }
// }

abstract class SsssssssState {}

class ssssssssssState extends SsssssssState{

}

class SuccessssssssssssState extends SsssssssState{
  SuccessssssssssssState(this.ghazaliatHafezEstekhare,);
  final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
 
  }

  class sssssssssssStateTow extends SsssssssState{
  sssssssssssStateTow(this.ghazaliatHafezEstekhare);
  final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
  }
  
class LoadingssssssssssseState extends SsssssssState{

}
class ErrorssssssssseState extends SsssssssState{
 final String errorText;
 ErrorssssssssseState(this.errorText);
}

class ClickedssssssssState extends SsssssssState {
  ClickedssssssssState(this.Cliiiiccccc);
    // final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
bool Cliiiiccccc;

}