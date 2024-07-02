import 'package:flutter/material.dart';

import '../models/test_card_model.dart';


class TestCardProvider with ChangeNotifier {
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
}
