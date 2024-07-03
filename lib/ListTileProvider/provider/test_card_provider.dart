import 'package:flutter/material.dart';

import '../models/test_card_model.dart';


class TestCardProvider extends ChangeNotifier {
  late TestCardModel _cardModel;
  final List<TestCardModel> _cards = List.generate(10,(index) => TestCardModel(
      head1: 'Test ${index + 1}',
      head2: 'Sub test ${index + 1}',
      img: const AssetImage("assets/images/profile.jpg"),
    ),
  );

  List<TestCardModel> get cards => _cards;

  void deleteCard(int index) {
    _cards.removeAt(index);
    notifyListeners();
  }

  void updateCard( String head1,final String head2,final ImageProvider img){
    _cardModel=TestCardModel(head1: head1, head2: head2, img: img);
    notifyListeners();
  }
}
