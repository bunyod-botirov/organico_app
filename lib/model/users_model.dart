import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  UsersModel({
    this.fullname,
    this.phoneNumber,
    this.password,
    this.joinTime,
    this.email,
    this.photo,
    this.addresess,
    this.coupons,
    this.favourites,
    this.historyOfOrders,
    this.currentOrders,
  });

  String? fullname;
  String? phoneNumber;
  String? password;
  Timestamp? joinTime;
  String? email;
  String? photo;
  List<dynamic>? addresess;
  List<dynamic>? coupons;
  List<dynamic>? favourites;
  List<dynamic>? historyOfOrders;
  List<dynamic>? currentOrders;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        joinTime: json["joinTime"],
        email: json["email"],
        photo: json["photo"],
        addresess: List<dynamic>.from(json["addresess"].map((x) => x)),
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
        historyOfOrders:
            List<dynamic>.from(json["historyOfOrders"].map((x) => x)),
        currentOrders: List<dynamic>.from(json["currentOrders"].map((x) => x)),
      );
}
