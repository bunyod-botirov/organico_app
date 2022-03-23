import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  bool inAppNotif = true;
  bool promo = true;
  bool tips = true;
  bool update = false;

  void changeInAppNotif() {
    inAppNotif = !inAppNotif;
    notifyListeners();
  }

  void changePromo() {
    promo = !promo;
    notifyListeners();
  }

  void changeTips() {
    tips = !tips;
    notifyListeners();
  }

  void changeUpdate() {
    update = !update;
    notifyListeners();
  }
}
