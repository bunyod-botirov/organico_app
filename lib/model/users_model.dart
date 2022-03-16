import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  UsersModel({
    this.fullname,
    this.phoneNumber,
    this.password,
    this.joinTime,
    this.email,
    this.photo,
    this.address,
    this.coupons,
    this.favourites,
    this.historyOfOrders,
    this.cart,
  });

  String? fullname;
  String? phoneNumber;
  String? password;
  Timestamp? joinTime;
  String? email;
  String? photo;
  String? address;
  List<dynamic>? coupons;
  List<dynamic>? favourites;
  List<dynamic>? historyOfOrders;
  Cart? cart;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        joinTime: json["joinTime"],
        email: json["email"],
        photo: json["photo"],
        address: json["addresess"],
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
        historyOfOrders:
            List<dynamic>.from(json["historyOfOrders"].map((x) => x)),
        cart: Cart.fromJson(json["cart"]),
      );
}

class Cart {
  Cart({
    this.products,
    this.counts,
  });

  List<dynamic>? products;
  List<dynamic>? counts;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        products: List<dynamic>.from(json["products"].map((x) => x)),
        counts: List<dynamic>.from(json["counts"].map((x) => x)),
      );
}
