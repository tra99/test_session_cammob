import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/DarkLightMode/provider/them_provider.dart';
import 'package:test_cammob/DarkLightMode/theme/theme.dart';
import 'package:test_cammob/IntegrateAPI/provider/api_provider.dart';
import 'package:test_cammob/IntegrateAPI/screen/home_screen.dart';
import 'package:test_cammob/IntegrateAPI/auth/login_screen.dart';
import 'package:test_cammob/ListTileProvider/provider/test_card_provider.dart';
import 'package:test_cammob/ListTileProvider/screen/list_card.dart';
import 'package:test_cammob/providerTest1/provider_class.dart';
import 'FlutterGen/components/card.dart';
import 'IntegrateAPI/pagination/test_pagination.dart';
import 'providerTest1/DarkLight/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/IntegrateAPI/provider/api_provider.dart';
import 'package:test_cammob/providerTest1/DarkLight/provider.dart';

import 'providerTest1/Splashpage/splah_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (_) => HomeDataProvider()),
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
      home: ListCardItems(),
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
