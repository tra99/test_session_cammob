import 'package:flutter/widgets.dart';

class ConuterProvider extends ChangeNotifier{
  int value;
  ConuterProvider({
    this.value=0,
  });

  void incrementCounter(){
    value ++;
    notifyListeners();
  }

  void decrementCounter(){
    value --;
    notifyListeners();
  }
}