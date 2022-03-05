import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message.toString(),
            ),
          ),
        );
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

  void signIn(BuildContext context, String phoneNumber, String password) async {
    try {
      await _authUser.signInWithPhoneNumber(phoneNumber).whenComplete(
        () {
          var data = _firestore.collection("users").doc(phoneNumber).get();
        },
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  void signOut() {
    _authUser.signOut();
  }
}
