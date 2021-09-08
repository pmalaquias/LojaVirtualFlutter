import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  //usuario atual

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth firebaseAuth;
  Map<String, dynamic> userData = Map();
  FirebaseUser firebaseUser;

  bool isLoading = false;

  void singUp({
    @required Map<String, dynamic> userData,
    @required String password,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) {
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData['email'],
      password: password,
    ).then((user) async {
      firebaseUser = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
      }).catchError((error) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void singIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.
        collection('user').
        document(firebaseUser.uid).setData(userData);
  }
}
