import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  final List<String> _menuItems = [];
  bool _isLoading = false;
  int _page = 0;

  List<String> get menuItems => _menuItems;
  bool get isLoading => _isLoading;

  
  Future<void> loadMenuItems() async {
    if (_isLoading) return; 

    _isLoading = true;
    notifyListeners();

    
    await Future.delayed(const Duration(seconds: 2));

    
    _menuItems.addAll(
      List.generate(10, (index) => 'Dish ${_page * 10 + index + 1}'),
    );

    _page++;

    _isLoading = false;
    notifyListeners();
  }
}
