// Automatic FlutterFlow imports
// Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> changePassword(
  BuildContext context,
  String currentPassword,
  String newPassword,
) async {
  // Add your function code here!
  bool success = false;

  //Create an instance of the current user.
  var user = FirebaseAuth.instance.currentUser!;
  //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

  final cred = EmailAuthProvider.credential(
      email: user.email!, password: currentPassword);
  await user.reauthenticateWithCredential(cred).then((value) async {
    await user.updatePassword(newPassword).then((_) {
      success = true;
      var uid;
      var usersRef;
      usersRef.doc(uid).update({"password": newPassword});
    }).catchError((error) {
      print(error);
    });
  }).catchError((err) {
    print(err);
  });

  return success;
}
