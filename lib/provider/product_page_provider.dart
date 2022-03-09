import 'package:flutter/cupertino.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';

class ProductPageProvider extends ChangeNotifier {
  int productCount = 1;
  bool descriptionText = true;

  void incrementProduct() {
    productCount++;
    notifyListeners();
  }

  void decrementProduct() {
    if (productCount > 1) {
      productCount--;
      notifyListeners();
    }
  }

  void changeDescription() {
    descriptionText = !descriptionText;
    notifyListeners();
  }

  void addToFavourites(UsersModel user, All product) {
    if (!user.favourites!.contains(product)) {
      user.favourites!.add(product);
    } else {
      user.favourites!.remove(product);
    }
    notifyListeners();
  }
}
