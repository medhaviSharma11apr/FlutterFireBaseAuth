import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sending Otp To User
  static String verifyId = "";
  static Future sendOtp({
    required String phoneNumber,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
            timeout: const Duration(seconds: 30),
            phoneNumber: "+91$phoneNumber",
            verificationCompleted: ((phoneAuthCredential) async {}),
            verificationFailed: ((error) async {}),
            codeSent: ((verificationId, forceResendingToken) async {
              verifyId = verificationId;
              nextStep();
            }),
            codeAutoRetrievalTimeout: ((verificationId) async {}))
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  // verify the otp code and login
  static Future loginWithOtp({required String otp}) async {
    final cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        return "Success";
      } else {
        return "Error ";
      }
    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text(e.toString()));
    } catch (e) {
      return e.toString();
    }
  }

  // To Logout Function
  static Future logout() async {
    await _firebaseAuth.signOut();
  }

  // check wheather user is logged in

  static Future<bool> isLoggedIn() async {
    log('in heerecgevh');
    var user = _firebaseAuth.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
