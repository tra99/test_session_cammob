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

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider()),
        ChangeNotifierProvider(create: (context) => HomeDataProvider()),
        // Add more providers here
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListCardItems(),
      ),
    ),
  );
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
