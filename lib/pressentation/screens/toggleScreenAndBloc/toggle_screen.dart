
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/bloc_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/event_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/state_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
 List<int> ids = [];
class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//      BlocBuilder<AppBlocs, AppSatate>(
//   builder: (context, state) {
//     return Center(
//       child: GestureDetector(
//         onTap: () {
//           BlocProvider.of<AppBlocs>(context).add(ChangeTabEvent(1));
//           print("jjj");
//         },
//         child: Container(
//           width: 50,
//           height: 50,
//           color: state.tabStatusList[1] ? Colors.amber : Colors.red,
//         ),
//       ),
//     );
//   },
// )

            ],
          ),
        ),
      )
    );
  }
}


// void _saveData()async{
//   print("saveData");
//  var user = FavoriteModel(ids:ids );
//   var box = await Hive.openBox("userInfo");
//     box.add(user);
//     await  box.close();     
//    }