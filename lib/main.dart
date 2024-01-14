
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/screens/home_screen/home_screen.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
 
   WidgetsFlutterBinding.ensureInitialized();
     SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
     if(!kIsWeb){
 Directory dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  }else{
    Hive.defaultDirectory = './';
    // Isar.
  }
  await injector();
  runApp(
  MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GhazaliatHafezBloc>(
          create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
        ),
        BlocProvider<DetailsGhazaliatHafezBloc>(
            create: (context) =>
                DetailsGhazaliatHafezBloc()..add(LoadedddEvent(0))),
      ],
      child:  MaterialApp(
        title: 'Your App Title',
        theme: MyTHeme.lightTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}