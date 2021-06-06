import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirAuth {
  static final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
  static var ref = FirebaseDatabase.instance.reference().child("users");
//   static createUser(String email, Function onSuccess) {
//     var user = Map<String, String>();

//     user["email"] = email;
//     print(42);
//     var ref = FirebaseDatabase.instance.reference().child("users");
//     ref.child(email).set(user).then((value) {
//       print("on value: SUCCESSED");
//       onSuccess();
//     }).catchError((err) {
//       _onSignUpErr(err.code);
//     });
//   }
}

class User {
  static String id;
  static String email;
  static String fName;
  static String lName;
  static String address;
  static String phone;
  User(String email, String fName, String lName, String address, String phone);
}

void addDetailInfo(String email, String fName, String lName, String address,
    String phone, Function onSuccess) {
  //User user = new User(email, fName, lName, address, phone);
  //var user = Firebase.auth().currentUser;
  //FirAuth.fireBaseAuth
}

void createAccount(String email, Function onSuccess) {
  FirAuth.fireBaseAuth
      .createUserWithEmailAndPassword(email: email, password: '123456789')
      .then((result) => onSuccess())
      .catchError((err) {
    _onSignUpErr(err.code);
  });
}

void _onSignUpErr(String code, {Function(String) onRegisterError}) {
  switch (code) {
    case "ERROR_INVALID_EMAIL":
    case "ERROR_INVALID_CREDENTIAL":
      onRegisterError("Invalid email");
      break;
    case "ERROR_EMAIL_ALREADY_IN_USE":
      onRegisterError("Email has existed");
      break;
    case "ERROR_WEAK_PASSWORD":
      onRegisterError("The password is not strong enough");
      break;
    default:
      onRegisterError("SignUp fail, please try again");
      break;
  }
}
//,String fName, String lName, String address, String phone
