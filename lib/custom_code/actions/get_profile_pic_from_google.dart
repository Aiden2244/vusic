// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_sign_in/google_sign_in.dart';

Future getProfilePicFromGoogle(DocumentReference? user) async {
  // set field 'profile_pic' in  /users/profile collection equal to  user's google account profile pic
  try {
    // Get user's google account profile pic
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final String profilePicUrl = googleUser.photoUrl!;

    // Update user's profile pic in Firestore
    await user!.update({'profile_pic': profilePicUrl});

    // Return success message
    return 'Profile pic updated successfully';
  } catch (StackTrace) {
    return 'Error getting profile pic';
  }
}
