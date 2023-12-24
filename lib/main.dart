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
          create: (context) => DetailsGhazaliatHafezBloc()..add(LoadedddEvent())),
      ],
      child:  MaterialApp(
        title: 'Your App Title',
        home: GhazaliatHafezScreen(),
      ),
    );
  }
}


