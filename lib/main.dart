import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cammob/DarkLightMode/provider/them_provider.dart';
import 'package:test_cammob/DarkLightMode/theme/theme.dart';
import 'package:test_cammob/IntegrateAPI/screen/home_screen.dart';
import 'package:test_cammob/IntegrateAPI/auth/login_screen.dart';
import 'package:test_cammob/ListTileProvider/provider/test_card_provider.dart';
import 'package:test_cammob/ListTileProvider/screen/list_card.dart';
import 'FlutterGen/components/card.dart';
import 'IntegrateAPI/pagination/test_pagination.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.themeData,
          home: HomeScreen(),
        );
      },
    );

// ----------------------Provider with Cubit -------------
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: BlocProvider(
  //       create: (_) => UserCubit(),
  //       child: UserScreen(),
  //     ),
  //   );
  // }

  // --------------------- Provider ----------------------
    // return MultiProvider(
    //   providers:[
    //     ChangeNotifierProvider(create: (context)=> ConuterProvider(),),
    //     ChangeNotifierProvider(create: (context)=> ChangeNameProvider()),
    //   ],
    //   child: const MaterialApp(
    //     title: 'Flutter Demo',
    //     debugShowCheckedModeBanner: false,
    //     home: TestChangeNameProvider(),
    //   ),
    // );
  }
}
