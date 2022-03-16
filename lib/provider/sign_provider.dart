import 'package:flutter/cupertino.dart';

class SignProvider extends ChangeNotifier {
  String popupValue = "+998";
  bool obsecureText = true;
  bool termsOfUse = false;

  void changePopupValue(Object? value) {
    popupValue = value.toString();
    notifyListeners();
  }

  void changeObsecureText() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  void changeTermsOfUse() {
    termsOfUse = !termsOfUse;
    notifyListeners();
  }
}
