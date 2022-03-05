import 'package:cloud_firestore/cloud_firestore.dart';

Map a = {
  "users": [
    {
      "fullname": "",
      "phoneNumber": "",
      "password": "",
      "photo": "",
      "joinedTime": Timestamp,
      "addreses": <String>[],
      "coupons": [],
      "favourites": [],
      "historyOfOrders": [],
      "currentOrders": [],
    },
  ],
  "products": {
    "categories": {
      "Vegitables": [],
      "Fruits": [],
      "Meats": [],
    },
    "types": {
      "Best Selling": [],
      "New": [],
      "Popular": [],
    },
    "All": [],
  },
};
