import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organico_app/widgets/messenger_widget.dart';

class ProfileProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  File picture = File("");
  final ImagePicker _picker = ImagePicker();

  Future changePhoto(BuildContext context) async {
    await _picker.pickImage(source: ImageSource.gallery).then(
      (value) {
        picture = File(value!.path);
      },
    );
    MessengerW.messenger(
      context,
      "Loading...",
    );
    await _storage
        .ref("/${_authUser.currentUser!.phoneNumber}/photo")
        .putFile(picture)
        .then(
      (p0) async {
        String img = await p0.ref.getDownloadURL();
        await _firestore
            .collection("users")
            .doc(_authUser.currentUser!.phoneNumber)
            .update(
          {
            "photo": img,
          },
        );
      },
    );
    notifyListeners();
  }
}
