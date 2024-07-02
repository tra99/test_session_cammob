import 'package:flutter/widgets.dart';

class ChangeNameProvider extends ChangeNotifier{
  String? username;

  ChangeNameProvider({
    this.username="Chetra"
  });

  void ChangeName({
    required String newUserName,
  })async{
    username=newUserName;
    notifyListeners();
  }
}