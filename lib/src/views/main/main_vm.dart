import 'package:flutter/material.dart';

class MainVM extends ChangeNotifier {
  PageController pageController = PageController();
  int currentIndex = 0;

  void onSelect(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}