import 'package:flutter/material.dart';

class AppStateProvider with ChangeNotifier {
  bool _isStickyHeaderVisible = false;

  bool get isStickyHeaderVisible => _isStickyHeaderVisible;

  void showStickyHeader(bool isVisible) {
    _isStickyHeaderVisible = isVisible;
    notifyListeners();
  }
}
