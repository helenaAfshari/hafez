
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/bloc_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/event_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/state_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
           BlocBuilder<AppBlocs,AppSatate>(
            builder: (context, state) {
              return 
                 Center(
                child: GestureDetector(
                  onTap: () {
                   //context.read<AppBlocs>().add(ChangeTabEvent(0));
                   _saveData();

                    print("jjj$_saveData");
                  },
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                     itemCount:5,
                      itemBuilder: (context, index) {
                        return 
                         Container(
                        width: 50,
                        height: 50,
                       color: context.watch<AppBlocs>().state.tabStatuse
                                ? Colors.amber
                                : Colors.red,);
                      },
                      
                    ),
                  ),
                ),
              );
            },)
            ],
          ),
        ),
      )
    );
  }
}


void _saveData()async{
  print("saveData");
  

 var user = FavoriteModel(ids:ids );
  var box = await Hive.openBox("userInfo");
    box.add(user);
    await  box.close();     
   }