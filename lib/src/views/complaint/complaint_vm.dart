import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/dio_service.dart';

class ComplaintVM extends ChangeNotifier {
  PageController pageController = PageController();
  int currentIndex = 0;
  String category = "";
  bool isLoading = false;

  void navigator(String cty, int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    category = cty;
    notifyListeners();
  }

  void back() {
    if (currentIndex == 0) {
      SystemNavigator.pop();
    }else {
      currentIndex = 0;
      pageController.jumpToPage(0);
      notifyListeners();
    }
  }

  Future<void> sendMessage(String comment) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await DioNetwork.POST(DioNetwork.API_COMPLAINT_PROFILE,
          DioNetwork.bodyComplaintProfile(1, category, comment));
      if(response != null) {
        pageController.jumpToPage(2);
        currentIndex = 2;
        category = "";
        isLoading = false;
        notifyListeners();
      }else{
        //error
        isLoading = false;
        notifyListeners();
      }
    }catch(e) {
      //error
      isLoading = false;
      notifyListeners();
    }
  }
}