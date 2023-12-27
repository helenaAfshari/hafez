import 'package:autharization_hanna/core/resource/constants/theme/my_theme.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/screens/detailsghazaliathafez/details_ghazaliathafez_screen.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(
      providers: [
        BlocProvider<GhazaliatHafezBloc>(
          create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
        ),  
        BlocProvider<DetailsGhazaliatHafezBloc>(
          create: (context) => DetailsGhazaliatHafezBloc()..add(LoadedddEvent(0))),
      ],
      child:  MaterialApp(
        title: 'Your App Title',
        home: GhazaliatHafezScreen(),
      ),
    );
  }
}









// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // Event
// abstract class ItemEvent extends Equatable {}

// class ItemClicked extends ItemEvent {
//   final String itemId;

//   ItemClicked(this.itemId, {required ItemState currentState});

//   @override
//   List<Object?> get props => [itemId];
// }

// // State
// abstract class ItemState extends Equatable {}

// class InitialItemState extends ItemState {
//   @override
//   List<Object?> get props => [];
// }

// class ItemClickedState extends ItemState {
//   final String itemId;

//   ItemClickedState(this.itemId);

//   @override
//   List<Object?> get props => [itemId];
// }

// // Bloc
// class ItemBloc extends Bloc<ItemEvent, ItemState> {
//   ItemBloc() : super(InitialItemState());

//   @override
//   Stream<ItemState> mapEventToState(ItemEvent event) async* {
//     if (event is ItemClicked) {
//       yield ItemClickedState(event.itemId);
//     }
//   }
// }


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ItemBloc(),
//         child: MyListView(),
//       ),
//     );
//   }
// }

// class MyListView extends StatelessWidget {
//   final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Clickable List'),
//       ),
//       body: BlocBuilder<ItemBloc, ItemState>(
//   builder: (context, state) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             // ارسال Event به Bloc هنگام کلیک
//             BlocProvider.of<ItemBloc>(context).add(ItemClicked(items[index], currentState: state));
            
//             // ناوبری به صفحه جدید با اطلاعات آیتم
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ItemDetailPage(itemName: items[index]),
//               ),
//             );
//           },
//           child: Card(
//             color: identical(state, ItemClickedState(items[index]))
//                 ? Colors.blueAccent
//                 : Colors.white,
//             child: ListTile(
//               title: Text(items[index]),
//             ),
//           ),
//         );
//       },
//     );
//   },
// ),

//     );
//   }
// }

// class ItemDetailPage extends StatelessWidget {
//   final String itemName;

//   ItemDetailPage({required this.itemName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Item Detail'),
//       ),
//       body: Center(
//         child: Text('Item Name: $itemName'),
//       ),
//     );
//   }
// }

