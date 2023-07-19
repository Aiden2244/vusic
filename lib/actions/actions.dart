import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future followArtist(BuildContext context) async {
  logFirebaseEvent('FollowArtist_backend_call');

  await currentUserReference!.update({
    'following_count': FieldValue.increment(1),
    'following': FieldValue.arrayUnion([FFAppState().lastSearchedUser]),
  });
  logFirebaseEvent('FollowArtist_backend_call');

  await FFAppState().lastSearchedUser!.update({
    'fan_count': FieldValue.increment(1),
    'fans': FieldValue.arrayUnion([currentUserReference]),
  });
}
