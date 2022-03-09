import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organico_app/widgets/messenger_widget.dart';

class AuthService {
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signUpWithPhoneNumber(BuildContext context, String phoneNumber) {
    _authUser.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Android Only
        await _authUser.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        MessengerW.messenger(context, e.message!);
      },
      codeSent: (String verificationId, int? resendToken) async {
        await Navigator.pushNamed(
          context,
          "/otp_page",
          arguments: verificationId,
        );
      },
      timeout: const Duration(minutes: 2),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signUpWithGoogle() {}

  Future signIn(
      BuildContext context, String phoneNumber, String password) async {
    try {
      var userData = _firestore.collection("users").doc(phoneNumber).get().then(
        (value) {
          if (value.data()!["password"] == password) {
            _authUser.verifyPhoneNumber(
              phoneNumber: phoneNumber,
              verificationCompleted: (PhoneAuthCredential credential) async {
                // Android Only
                await _authUser.signInWithCredential(credential);
              },
              verificationFailed: (FirebaseAuthException e) {
                MessengerW.messenger(context, e.message!);
              },
              codeSent: (String verificationId, int? resendToken) async {
                await Navigator.pushNamed(
                  context,
                  "/otp_page",
                  arguments: verificationId,
                );
              },
              timeout: const Duration(minutes: 2),
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          } else {
            MessengerW.messenger(context, "Email or Passwor was not correct!");
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      MessengerW.messenger(context, e.message!);
    }
  }

  void signOut() {
    _authUser.signOut();
  }
}
