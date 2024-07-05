import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/IntegrateAPI/provider/api_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_cammob/MuliLanguage/provider/change_language_provider.dart';
import 'package:test_cammob/firebase_options.dart';
import 'package:test_cammob/providerTest1/Splashpage/splah_screen.dart';
import 'package:test_cammob/providerTest1/provider_class.dart';
import 'package:test_cammob/providerTest1/screen_notifiaction/firebase_api.dart';
import 'package:test_cammob/providerTest1/screen_notifiaction/notification_push.dart';
import 'MuliLanguage/swap_language.dart';
import 'providerTest1/DarkLight/provider.dart';

final navigatorKey=GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseApi().initNotification();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (_) => HomeDataProvider()),
        ChangeNotifierProvider(create: (_) => ListProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final localProvider=Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
      locale: localProvider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MySplashScreen(),
      // home: MyNotificationScreen(),
      navigatorKey: navigatorKey,
      routes: {
        '/myHomePageNotification':(context)=>MyHomePageNotification(),
      },
    );
  }
}




// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return Consumer<ThemProvider>(
//     //   builder: (context, themeProvider, child) {
//     //     return MaterialApp(
//     //       theme: themeProvider.themeData,
//     //       home: HomeScreen(),
//     //     );
//     //   },
//     // );

// // ----------------------Provider with Cubit -------------
//   //   return MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     home: BlocProvider(
//   //       create: (_) => UserCubit(),
//   //       child: UserScreen(),
//   //     ),
//   //   );
//   // }

//   // --------------------- Provider ----------------------
//     return MultiProvider(
//       providers:[
//         // ChangeNotifierProvider(create: (context)=> ConuterProvider(),),
//         // ChangeNotifierProvider(create: (context)=> ChangeNameProvider()),
//         ChangeNotifierProvider(create: (context)=>TestCardProvider()),
//         ChangeNotifierProvider(create: (context)=>ProviderClass()),
//       ],
//       child: const MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         home: UpdateName(),
//       ),
//     );
//   }
// }
