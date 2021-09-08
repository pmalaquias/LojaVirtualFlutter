import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  //usuario atual

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth firebaseAuth;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void singUp(Map<String, dynamic> userData, String pass,
      VoidCallback onSuccess, VoidCallback onFail) {
    isLoading = true;
    notifyListeners();
  }

  void singIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}
}
