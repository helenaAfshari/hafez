import 'package:autharization_hanna/core/resource/constants/theme/my_theme.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTHeme.lightTheme(),
//       home: MultiBlocProvider(
//   providers: [
//     BlocProvider<GhazaliatHafezBloc>(
//       create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
//     ),
//   ],
//   child: const GhazaliatHafezScreen(),
// )
home: const DetailsGhazaliatHafezScreen (),

    );
  }
}
