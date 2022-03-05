import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:organico_app/model/users_model.dart';

class ServiceUsers {
  static Future<UsersModel> getUsers() async {
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get();

    return UsersModel.fromJson(user.data()!);
  }
}
