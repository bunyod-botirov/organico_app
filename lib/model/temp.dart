import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Map structure = {
  "users": [
    {
      "fullname": "",
      "phoneNumber": "",
      "password": "",
      "photo": "",
      "joinedTime": Timestamp,
      "addreses": [],
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

List<Color> containerColor = const [
  Color(0xFFE0F7FA),
  Color(0xFFFFF3E0),
  Color(0xFFFCE4EC),
  Color(0xFFF3E5F5),
  Color(0xFFFFFDE7),
  Color(0xFFE3F2FD),
  Color(0xFFFAFAFA),
];

Map firestore = {
  "Categories": [
    {
      'name': 'Fruits',
      'image':
          'https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png',
      'builder': [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Mandarin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFF3E0",
          "price": 1.69,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_c0f5dc2fbb9b73bc71c966f37c9ddfde_61b9dc5de43b5.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Ananas Bonanza",
          "category": "Fruit",
          "timeDelivery": "45 Min",
          "color": "0xFFFCE4EC",
          "price": 3.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000015-00008/small_1513336107440100202-00056.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Kivi Iran",
          "category": "Fruit",
          "timeDelivery": "60 Min",
          "color": "0xFFF3E5F5",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000009-00011/small_15915364650798046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Organic Bananas",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFFDE7",
          "price": 1.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000003-00003/small_15915364612328044.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Red Apples",
          "category": "Fruit",
          "timeDelivery": "15-20 Min",
          "color": "0xFFE3F2FD",
          "price": 1.59,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_07760baa2fe6b7ff63e14619c6829a88_61b9dc5e6dbde.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
    {
      'name': 'Vegetables',
      'image':
          'https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png',
      'builder': [
        {
          "name": "White Potato",
          "category": "Vegetable",
          "timeDelivery": "60-65 Min",
          "color": "0xFFE0F7FA",
          "price": 0.45,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000010-00006/small_15915363679097292.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Cabbage",
          "category": "Vegetable",
          "timeDelivery": "10 Min",
          "color": "0xFFFFF3E0",
          "price": 0.59,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000009-00011/small_15915363686077286.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Cabbage Red",
          "category": "Vegetable",
          "timeDelivery": "40 Min",
          "color": "0xFFFCE4EC",
          "price": 0.84,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000009-00009/small_1484813136998100101-00023.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Carrot Red Cleaned",
          "category": "Vegetable",
          "timeDelivery": "25-30 Min",
          "color": "0xFFF3E5F5",
          "price": 0.39,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000013-00004/small_15915364784507299.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Beet",
          "category": "Vegetable",
          "timeDelivery": "15-20 Min",
          "color": "0xFFFFFDE7",
          "price": 0.39,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000017-00001/small_15915364928967314.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ]
    },
    {
      'name': 'Meats',
      'image':
          'https://catalog.korzinka.uz/storage/products/small__61a7273b0e6c2.png',
      'builder': [
        {
          "name": "Qazi Sherin",
          "category": "Meat",
          "timeDelivery": "10 Min",
          "color": "0xFFE3F2FD",
          "price": 5.59,
          "image":
              "https://catalog.korzinka.uz/storage/api/115010401-00007/small_1595875165314040301-00079.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Indeyka",
          "category": "Meat",
          "timeDelivery": "35-45 Min",
          "color": "0xFFE0F7FA",
          "price": 5.99,
          "image":
              "https://catalog.korzinka.uz/storage/api/115010401-00014/small_1633882599496115010401-00014.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Doktorskaya",
          "category": "Meat",
          "timeDelivery": "15 Min",
          "color": "0xFFFFF3E0",
          "price": 5.19,
          "image":
              "https://catalog.korzinka.uz/storage/api/115020102-00019/small_1513167555252040101-00150.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Rozmetov",
          "category": "Meat",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFCE4EC",
          "price": 3.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/115020302-00002/small_1484812888507040102-00030.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Kolbasa",
          "category": "Meat",
          "timeDelivery": "15-20 Min",
          "color": "0xFFF3E5F5",
          "price": 2.99,
          "image":
              "https://catalog.korzinka.uz/storage/api/115020304-00009/small_1606508330896040102-00182.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Ikra GF",
          "category": "Meat",
          "timeDelivery": "30-40 Min",
          "color": "0xFFFAFAFA",
          "price": 6.15,
          "image":
              "https://catalog.korzinka.uz/storage/api/143030502-00001/small_1577105041059060401-00146.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Farel",
          "category": "Meat",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 6.99,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_bf7e19df_61b33b1c94ba2.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Grudinka",
          "category": "Meat",
          "timeDelivery": "55-60 Min",
          "color": "0xFFFFF3E0",
          "price": 4.99,
          "image":
              "https://catalog.korzinka.uz/storage/products/small__61a7273b0e6c2.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Grill",
          "category": "Meat",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFCE4EC",
          "price": 3.99,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_4837_fullimage_61a7273a65ea0.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
    {
      'name': 'Coffee & Tea',
      'image':
          'https://catalog.korzinka.uz/storage/api/139040203-00002/small_1484813273496130301-00048.jpg',
      'builder': [
        {
          "name": "Ahmad Tea",
          "category": "Tea",
          "timeDelivery": "30-35 Min",
          "color": "0xFFF3E5F5",
          "price": 2.29,
          "image":
              "https://catalog.korzinka.uz/storage/api/139040203-00002/small_1484813273496130301-00048.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Maccoffee Cappuccino",
          "category": "Coffee",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFFDE7",
          "price": 0.24,
          "image":
              "https://catalog.korzinka.uz/storage/api/138010003-00002/small_1594461564312IMG_5241-1.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Suhie Slivki",
          "category": "Coffee",
          "timeDelivery": "35 Min",
          "color": "0xFFE3F2FD",
          "price": 2.14,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_18629604c3e66cbf83b63ace1a4548093398ea60_61b33e07336cd.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "MacCoffe Original",
          "category": "Coffee",
          "timeDelivery": "20-25 Min",
          "color": "0xFFFAFAFA",
          "price": 1.14,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030001-00001/small_1495785658437130101-00038.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Nescafe Gold",
          "category": "Coffee",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.94,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030003-00011/small_1596822165028Gold%2075%20130101-00128.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
    {
      'name': 'Candys',
      'image':
          'https://catalog.korzinka.uz/storage/api/154070002-00003/small_1611339592139_MG_7401-1.jpg',
      'builder': [
        {
          "name": "Bahroma Fistashka",
          "category": "Candy",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFF3E0",
          "price": 0.69,
          "image":
              "https://catalog.korzinka.uz/storage/api/108070004-00004/small_1574766317264090402-00046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Bahroma Injir",
          "category": "Candy",
          "timeDelivery": "50-60 Min",
          "color": "0xFFFCE4EC",
          "price": 0.69,
          "image":
              "https://catalog.korzinka.uz/storage/api/108070005-00003/small_15277575659903.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Tulskiy Pryanik",
          "category": "Candy",
          "timeDelivery": "25-30 Min",
          "color": "0xFFF3E5F5",
          "price": 0.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/154070002-00003/small_1611339592139_MG_7401-1.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Alenka",
          "category": "Candy",
          "timeDelivery": "10-15 Min",
          "color": "0xFFFFFDE7",
          "price": 1.39,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_54efc524f341383b6d00175d_61b6e8a01309a.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
  ],
  "Types": [
    {
      "type": "Best Selling",
      "builder": [
        {
          "name": "MacCoffe Original",
          "category": "Coffee",
          "timeDelivery": "20-25 Min",
          "color": "0xFFFAFAFA",
          "price": 1.14,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030001-00001/small_1495785658437130101-00038.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Beet",
          "category": "Vegetable",
          "timeDelivery": "15-20 Min",
          "color": "0xFFFFFDE7",
          "price": 0.39,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000017-00001/small_15915364928967314.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Tulskiy Pryanik",
          "category": "Candy",
          "timeDelivery": "25-30 Min",
          "color": "0xFFF3E5F5",
          "price": 0.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/154070002-00003/small_1611339592139_MG_7401-1.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Kolbasa",
          "category": "Meat",
          "timeDelivery": "15-20 Min",
          "color": "0xFFF3E5F5",
          "price": 2.99,
          "image":
              "https://catalog.korzinka.uz/storage/api/115020304-00009/small_1606508330896040102-00182.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Maccoffee Cappuccino",
          "category": "Coffee",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFFDE7",
          "price": 0.24,
          "image":
              "https://catalog.korzinka.uz/storage/api/138010003-00002/small_1594461564312IMG_5241-1.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Rozmetov",
          "category": "Meat",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFCE4EC",
          "price": 3.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/115020302-00002/small_1484812888507040102-00030.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Carrot Red Cleaned",
          "category": "Vegetable",
          "timeDelivery": "25-30 Min",
          "color": "0xFFF3E5F5",
          "price": 0.39,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000013-00004/small_15915364784507299.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Organic Bananas",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFFDE7",
          "price": 1.49,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000003-00003/small_15915364612328044.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
    {
      "type": "New",
      "builder": [
        {
          "name": "Bahroma Fistashka",
          "category": "Candy",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFF3E0",
          "price": 0.69,
          "image":
              "https://catalog.korzinka.uz/storage/api/108070004-00004/small_1574766317264090402-00046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Nescafe Gold",
          "category": "Coffee",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.94,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030003-00011/small_1596822165028Gold%2075%20130101-00128.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Qazi Sherin",
          "category": "Meat",
          "timeDelivery": "10 Min",
          "color": "0xFFE3F2FD",
          "price": 5.59,
          "image":
              "https://catalog.korzinka.uz/storage/api/115010401-00007/small_1595875165314040301-00079.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Mandarin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFF3E0",
          "price": 1.69,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_c0f5dc2fbb9b73bc71c966f37c9ddfde_61b9dc5de43b5.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
    {
      "type": "Popular",
      "builder": [
        {
          "name": "Indeyka",
          "category": "Meat",
          "timeDelivery": "35-45 Min",
          "color": "0xFFE0F7FA",
          "price": 5.99,
          "image":
              "https://catalog.korzinka.uz/storage/api/115010401-00014/small_1633882599496115010401-00014.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Kivi Iran",
          "category": "Fruit",
          "timeDelivery": "60 Min",
          "color": "0xFFF3E5F5",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000009-00011/small_15915364650798046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Cabbage Red",
          "category": "Vegetable",
          "timeDelivery": "40 Min",
          "color": "0xFFFCE4EC",
          "price": 0.84,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000009-00009/small_1484813136998100101-00023.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Farel",
          "category": "Meat",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 6.99,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_bf7e19df_61b33b1c94ba2.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Ahmad Tea",
          "category": "Tea",
          "timeDelivery": "30-35 Min",
          "color": "0xFFF3E5F5",
          "price": 2.29,
          "image":
              "https://catalog.korzinka.uz/storage/api/139040203-00002/small_1484813273496130301-00048.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Alenka",
          "category": "Candy",
          "timeDelivery": "10-15 Min",
          "color": "0xFFFFFDE7",
          "price": 1.39,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_54efc524f341383b6d00175d_61b6e8a01309a.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
      ],
    },
  ],
  "All": [
    {
      "name": "Apelsin Turkiya",
      "category": "Fruit",
      "timeDelivery": "25-30 Min",
      "color": "0xFFE0F7FA",
      "price": 1.79,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Mandarin Turkiya",
      "category": "Fruit",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFFF3E0",
      "price": 1.69,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_c0f5dc2fbb9b73bc71c966f37c9ddfde_61b9dc5de43b5.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Ananas Bonanza",
      "category": "Fruit",
      "timeDelivery": "45 Min",
      "color": "0xFFFCE4EC",
      "price": 3.49,
      "image":
          "https://catalog.korzinka.uz/storage/api/149000015-00008/small_1513336107440100202-00056.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Kivi Iran",
      "category": "Fruit",
      "timeDelivery": "60 Min",
      "color": "0xFFF3E5F5",
      "price": 1.79,
      "image":
          "https://catalog.korzinka.uz/storage/api/149000009-00011/small_15915364650798046.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Organic Bananas",
      "category": "Fruit",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFFFDE7",
      "price": 1.49,
      "image":
          "https://catalog.korzinka.uz/storage/api/149000003-00003/small_15915364612328044.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Red Apples",
      "category": "Fruit",
      "timeDelivery": "15-20 Min",
      "color": "0xFFE3F2FD",
      "price": 1.59,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_07760baa2fe6b7ff63e14619c6829a88_61b9dc5e6dbde.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "White Potato",
      "category": "Vegetable",
      "timeDelivery": "60-65 Min",
      "color": "0xFFE0F7FA",
      "price": 0.45,
      "image":
          "https://catalog.korzinka.uz/storage/api/122000010-00006/small_15915363679097292.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Cabbage",
      "category": "Vegetable",
      "timeDelivery": "10 Min",
      "color": "0xFFFFF3E0",
      "price": 0.59,
      "image":
          "https://catalog.korzinka.uz/storage/api/122000009-00011/small_15915363686077286.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Cabbage Red",
      "category": "Vegetable",
      "timeDelivery": "40 Min",
      "color": "0xFFFCE4EC",
      "price": 0.84,
      "image":
          "https://catalog.korzinka.uz/storage/api/122000009-00009/small_1484813136998100101-00023.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Carrot Red Cleaned",
      "category": "Vegetable",
      "timeDelivery": "25-30 Min",
      "color": "0xFFF3E5F5",
      "price": 0.39,
      "image":
          "https://catalog.korzinka.uz/storage/api/122000013-00004/small_15915364784507299.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Beet",
      "category": "Vegetable",
      "timeDelivery": "15-20 Min",
      "color": "0xFFFFFDE7",
      "price": 0.39,
      "image":
          "https://catalog.korzinka.uz/storage/api/122000017-00001/small_15915364928967314.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Qazi Sherin",
      "category": "Meat",
      "timeDelivery": "10 Min",
      "color": "0xFFE3F2FD",
      "price": 5.59,
      "image":
          "https://catalog.korzinka.uz/storage/api/115010401-00007/small_1595875165314040301-00079.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Indeyka",
      "category": "Meat",
      "timeDelivery": "35-45 Min",
      "color": "0xFFE0F7FA",
      "price": 5.99,
      "image":
          "https://catalog.korzinka.uz/storage/api/115010401-00014/small_1633882599496115010401-00014.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Doktorskaya",
      "category": "Meat",
      "timeDelivery": "15 Min",
      "color": "0xFFFFF3E0",
      "price": 5.19,
      "image":
          "https://catalog.korzinka.uz/storage/api/115020102-00019/small_1513167555252040101-00150.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Rozmetov",
      "category": "Meat",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFCE4EC",
      "price": 3.49,
      "image":
          "https://catalog.korzinka.uz/storage/api/115020302-00002/small_1484812888507040102-00030.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Kolbasa",
      "category": "Meat",
      "timeDelivery": "15-20 Min",
      "color": "0xFFF3E5F5",
      "price": 2.99,
      "image":
          "https://catalog.korzinka.uz/storage/api/115020304-00009/small_1606508330896040102-00182.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Ikra GF",
      "category": "Meat",
      "timeDelivery": "30-40 Min",
      "color": "0xFFFAFAFA",
      "price": 6.15,
      "image":
          "https://catalog.korzinka.uz/storage/api/143030502-00001/small_1577105041059060401-00146.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Farel",
      "category": "Meat",
      "timeDelivery": "25-30 Min",
      "color": "0xFFE0F7FA",
      "price": 6.99,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_bf7e19df_61b33b1c94ba2.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Grudinka",
      "category": "Meat",
      "timeDelivery": "55-60 Min",
      "color": "0xFFFFF3E0",
      "price": 4.99,
      "image":
          "https://catalog.korzinka.uz/storage/products/small__61a7273b0e6c2.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Grill",
      "category": "Meat",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFCE4EC",
      "price": 3.99,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_4837_fullimage_61a7273a65ea0.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Ahmad Tea",
      "category": "Tea",
      "timeDelivery": "30-35 Min",
      "color": "0xFFF3E5F5",
      "price": 2.29,
      "image":
          "https://catalog.korzinka.uz/storage/api/139040203-00002/small_1484813273496130301-00048.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Maccoffee Cappuccino",
      "category": "Coffee",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFFFDE7",
      "price": 0.24,
      "image":
          "https://catalog.korzinka.uz/storage/api/138010003-00002/small_1594461564312IMG_5241-1.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Suhie Slivki",
      "category": "Coffee",
      "timeDelivery": "35 Min",
      "color": "0xFFE3F2FD",
      "price": 2.14,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_18629604c3e66cbf83b63ace1a4548093398ea60_61b33e07336cd.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "MacCoffe Original",
      "category": "Coffee",
      "timeDelivery": "20-25 Min",
      "color": "0xFFFAFAFA",
      "price": 1.14,
      "image":
          "https://catalog.korzinka.uz/storage/api/138030001-00001/small_1495785658437130101-00038.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Nescafe Gold",
      "category": "Coffee",
      "timeDelivery": "25-30 Min",
      "color": "0xFFE0F7FA",
      "price": 1.94,
      "image":
          "https://catalog.korzinka.uz/storage/api/138030003-00011/small_1596822165028Gold%2075%20130101-00128.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Bahroma Fistashka",
      "category": "Candy",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFFF3E0",
      "price": 0.69,
      "image":
          "https://catalog.korzinka.uz/storage/api/108070004-00004/small_1574766317264090402-00046.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Bahroma Injir",
      "category": "Candy",
      "timeDelivery": "50-60 Min",
      "color": "0xFFFCE4EC",
      "price": 0.69,
      "image":
          "https://catalog.korzinka.uz/storage/api/108070005-00003/small_15277575659903.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Tulskiy Pryanik",
      "category": "Candy",
      "timeDelivery": "25-30 Min",
      "color": "0xFFF3E5F5",
      "price": 0.49,
      "image":
          "https://catalog.korzinka.uz/storage/api/154070002-00003/small_1611339592139_MG_7401-1.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Alenka",
      "category": "Candy",
      "timeDelivery": "10-15 Min",
      "color": "0xFFFFFDE7",
      "price": 1.39,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_54efc524f341383b6d00175d_61b6e8a01309a.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
  ],
};

Map model = {
  "Categories": [
    {
      "name": "Fruits",
      "image": "",
      "builder": [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    },
    {
      "name": "Vegetables",
      "image": "",
      "builder": [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    },
    {
      "name": "Meats",
      "image": "",
      "builder": [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    },
    {
      "name": "Coffee & Tea",
      "image": "",
      "builder": [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    },
    {
      "name": "",
      "image": "Candys",
      "builder": [
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Apelsin Turkiya",
          "category": "Fruit",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    }
  ],
  "Types": [
    {
      "type": "Best Selling",
      "builder": [
        {
          "name": "MacCoffe Original",
          "category": "Coffee",
          "timeDelivery": "20-25 Min",
          "color": "0xFFFAFAFA",
          "price": 1.14,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030001-00001/small_1495785658437130101-00038.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Beet",
          "category": "Vegetable",
          "timeDelivery": "15-20 Min",
          "color": "0xFFFFFDE7",
          "price": 0.39,
          "image":
              "https://catalog.korzinka.uz/storage/api/122000017-00001/small_15915364928967314.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ],
    },
    {
      "type": "New",
      "builder": [
        {
          "name": "Bahroma Fistashka",
          "category": "Candy",
          "timeDelivery": "25-30 Min",
          "color": "0xFFFFF3E0",
          "price": 0.69,
          "image":
              "https://catalog.korzinka.uz/storage/api/108070004-00004/small_1574766317264090402-00046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Nescafe Gold",
          "category": "Coffee",
          "timeDelivery": "25-30 Min",
          "color": "0xFFE0F7FA",
          "price": 1.94,
          "image":
              "https://catalog.korzinka.uz/storage/api/138030003-00011/small_1596822165028Gold%2075%20130101-00128.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ],
    },
    {
      "type": "Popular",
      "builder": [
        {
          "name": "Indeyka",
          "category": "Meat",
          "timeDelivery": "35-45 Min",
          "color": "0xFFE0F7FA",
          "price": 5.99,
          "image":
              "https://catalog.korzinka.uz/storage/api/115010401-00014/small_1633882599496115010401-00014.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "name": "Kivi Iran",
          "category": "Fruit",
          "timeDelivery": "60 Min",
          "color": "0xFFF3E5F5",
          "price": 1.79,
          "image":
              "https://catalog.korzinka.uz/storage/api/149000009-00011/small_15915364650798046.jpg",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ]
    }
  ],
  "All": [
    {
      "name": "Apelsin Turkiya",
      "category": "Fruit",
      "timeDelivery": "25-30 Min",
      "color": "0xFFE0F7FA",
      "price": 1.79,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_3cbf3bd41c_1000_61b9dc5d49872.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {
      "name": "Mandarin Turkiya",
      "category": "Fruit",
      "timeDelivery": "25-30 Min",
      "color": "0xFFFFF3E0",
      "price": 1.69,
      "image":
          "https://catalog.korzinka.uz/storage/products/small_c0f5dc2fbb9b73bc71c966f37c9ddfde_61b9dc5de43b5.png",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    }
  ]
};
