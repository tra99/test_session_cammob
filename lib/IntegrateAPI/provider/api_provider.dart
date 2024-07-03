import 'package:flutter/material.dart';
import 'package:test_cammob/IntegrateAPI/model/home_model.dart';

import '../service/home_screen_service.dart';

class HomeDataProvider extends ChangeNotifier {
  final _service = RemoteApiHomeData();
  bool isLoading = false;
  int page = 1;
  List<HomeModel> _homeData = [];
  List<HomeModel> get homeData => _homeData;

  Future<void> getAllHomeData({bool loadMore = false}) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    if (loadMore) page++;

    final response = await RemoteApiHomeData.fetchPosts(page);

    if (loadMore) {
      _homeData.addAll(response);
    } else {
      _homeData = response;
    }

    isLoading = false;
    notifyListeners();
  }
}