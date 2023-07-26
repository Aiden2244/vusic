import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future followArtist(BuildContext context) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('FollowArtist_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'following': FieldValue.arrayUnion([FFAppState().lastSearchedUser]),
      'friends_count': FieldValue.increment(1),
    });
    logFirebaseEvent('FollowArtist_backend_call');

    firestoreBatch.update(FFAppState().lastSearchedUser!, {
      'fan_count': FieldValue.increment(1),
      'fans': FieldValue.arrayUnion([currentUserReference]),
    });
  } finally {
    await firestoreBatch.commit();
  }
}
