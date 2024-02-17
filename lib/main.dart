
import 'dart:io';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:hafez/core/bottomnavigationbar/custom_buttom_navigation.dart';
import 'package:hafez/core/resource/constants/theme/my_theme.dart';
import 'package:hafez/firebase_options.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/bloc_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding();
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("fcM token::::"+fcmToken!);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp());
}
// void main() async {
  
//    WidgetsFlutterBinding.ensureInitialized();
   
//      SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]);
//    if(!kIsWeb){
// // if (!foundation.kIsWeb) {
//  Directory dir = await getApplicationDocumentsDirectory();
//   Hive.defaultDirectory = dir.path;
//   }else{
//     Hive.defaultDirectory = './';
//   }
//   await injector();

//   runApp(
//   MyApp()
//   );
// }
 Offset? _tapPosition;
   BlocEstekhare blocEstekharee = BlocEstekhare();

int clickCount = 0; // تعداد کلیک‌ها را حساب می‌کند
bool isLimitReached = false; // برای اطمینان از رسیدن به حداکثر تعداد کلیک‌ها

 generateRandomNumber() {
  if (!isLimitReached) { // تنها اگر به حداکثر تعداد کلیک‌ها نرسیده باشیم
    clickCount++; // تعداد کلیک‌ها را افزایش می‌دهیم
    if (clickCount >= 10) { // اگر تعداد کلیک‌ها بیشتر یا مساوی ۳ شود
      isLimitReached = true; // وضعیت رسیدن به حداکثر تعداد کلیک‌ها را به true تغییر می‌دهیم
      print('You have reached the maximum number of clicks.'); // اطلاع رسانی به کاربر
    } else {
      int randomNumber = blocEstekharee.nextNumber(index: 400); // تولید عدد تصادفی
      print('Random Number: $randomNumber');
      return randomNumber;
    }
  }
  return null; // یا مقدار خاصی که مد نظر شما باشد
}


class BlocProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GhazaliatHafezBloc>(
          create: (context) => GhazaliatHafezBloc()..add(LoadedEvent()),
        ),
        BlocProvider<DetailsGhazaliatHafezBloc>(
          create: (context) => DetailsGhazaliatHafezBloc()..add(LoadedddEvent(0))),
        BlocProvider<BlocEstekhare>(
          create: (context) => BlocEstekhare()..add(EstekhareLoadedEvent(generateRandomNumber()))),
      ],
      child: MaterialApp(
        theme: MyTHeme.lightTheme(),
        home: CustomBottomNavigation(),
        // home:  SamplePageView(),
        // initialRoute: ScreenNames.homeScreen,
        // routes: routes,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProviders();
  }
}


