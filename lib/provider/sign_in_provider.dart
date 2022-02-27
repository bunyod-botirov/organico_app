import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  String popupValue = "+998";

  void changePopupValue(Object? value) {
    popupValue = value.toString();
    notifyListeners();
  }
}
