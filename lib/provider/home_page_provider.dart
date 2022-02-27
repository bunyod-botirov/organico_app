import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {
  String dropDownValue = "Toshkent";

  void changeDropDownValue(Object? value) {
    dropDownValue = value.toString();
    notifyListeners();
  }
}
