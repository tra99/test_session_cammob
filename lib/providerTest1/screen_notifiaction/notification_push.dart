import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class MyHomePageNotification extends StatelessWidget {
  const MyHomePageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final message=ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                // backgroundColor: Colors.grey,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/jpg/profile.jpg")
                ),
              ),
              title: Text(message.notification!.title.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text(message.notification!.body.toString()),
            ),
          ),
          // Text(message.notification!.title.toString()),
          // Text(message.notification!.body.toString()),
          // Text(message.data.toString()),
        ],
      ),
    );
  }
}