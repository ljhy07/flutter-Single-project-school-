import 'package:flutter/foundation.dart';

class ShoppingCartState extends ChangeNotifier {
  int _selectedId = 0;

  int get selectedId => _selectedId;

  void updateSelectedId(int id) {
    _selectedId = id;
    notifyListeners();
  }
}
