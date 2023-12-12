
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class GhazaliatHafezScreen extends StatelessWidget {
//   const GhazaliatHafezScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  BlocProvider<GhazaliatHafezBloc>(
//       create: (context) => GhazaliatHafezBloc(),
//       child: SafeArea(
//       child: Scaffold(
//         body:BlocBuilder<GhazaliatHafezBloc,GhazaliatHafezState>(
//         builder: (context, state) {
//           if(state is GhazaliatHafezInitialState|| state is GhazaliatHafezLoadingState){
//             return Center(
//               child:  CircularProgressIndicator(color: Colors.blue),
//             );
//           }
//           if(state is GhazaliatHafezSuccesState){
//             return Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              child: ListView.builder(
//               itemCount: state.ghazaliatHafez.length,
//               itemBuilder: (context, index) {
//                return Card(child: ListTile(
//                   title: Text(state.ghazaliatHafez[index].title??""),
                  
//                ),);
//              },),
//             );
          
//           }
//             if(state is GhazaliatHafezErrorState ){
//               return Center(
//                child: Text(state.errorText),
//               );
        
//             }
//             return Container();
//         },
//         ),
//       ),
//       ));
      
//   }
// }

class GhazaliatHafezScreen extends StatelessWidget {
  const GhazaliatHafezScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GhazaliatHafezBloc(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
            builder: (context, state) {
              if (state is GhazaliatHafezInitialState || state is GhazaliatHafezLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (state is GhazaliatHafezSuccesState) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: state.ghazaliatHafez.length,
                    itemBuilder: (context, index) {
                    //GhazaliatHafez ghazalItem = state.ghazaliatHafez[index];

                      return Card(
                        child: ListTile(
                         // title: Text(state.ghazaliatHafez[index].ghazaliatHafezToList.),

                        ),
                      );
                    },
                  ),
                );
              } else if (state is GhazaliatHafezErrorState) {
                return Center(
                  child: Text(state.errorText),
                );
              } else {
                // در صورتی که حالت دیگری وجود دارد
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

