import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_cammob/main.dart';

class FirebaseApi{
  final _firebaseMessaging=FirebaseMessaging.instance;
   
   Future<void> initNotification()async{
    // request permission from user
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device
    final fCMToken=await _firebaseMessaging.getToken();

    // to see token
    print('Token: $fCMToken');

    initPushNotifications();
   }

  void handleMessage(RemoteMessage? message){
    if(message==null) return;

    navigatorKey.currentState?.pushNamed(
      '/myHomePageNotification',
      arguments: message,
    );
  }

  Future initPushNotifications()async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}