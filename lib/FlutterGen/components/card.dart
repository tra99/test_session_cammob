// import 'package:flutter/material.dart';
// import 'package:test_cammob/FlutterGen/components/card1.dart';
// import 'package:test_cammob/FlutterGen/components/detail_screen.dart';
// import 'package:test_cammob/gen/assets.gen.dart';

// class CardWidget extends StatelessWidget {
//   const CardWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         centerTitle: true,
//         title: Text("List Card",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//       ),
//       body: ListView.builder(
//         itemCount: 10, 
//         itemBuilder: (context, index) {
//           return TestCard(
//             click: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen()));
//             },
//             head1: 'Test ${index + 1}',
//             head2: 'Sub test ${index + 1}',
//             img: AssetImage("assets/images/profile.jpg"),
//             delete: Icons.delete,
//           );
//         },
//       )
//     );
//   }
// }