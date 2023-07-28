import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future updateCurrentPage(BuildContext context) async {
  if (FFAppState().CurrentPage == null || FFAppState().CurrentPage == '') {
    logFirebaseEvent('UpdateCurrentPage_update_app_state');
    FFAppState().CurrentPage =
        'vusic://vusic.com${GoRouter.of(context).location}';
  } else {
    logFirebaseEvent('UpdateCurrentPage_update_app_state');
    FFAppState().LastPageVisited = FFAppState().CurrentPage;
    FFAppState().CurrentPage =
        'vusic://vusic.com${GoRouter.of(context).location}';
  }
}

Future unfriend(
  BuildContext context, {
  required DocumentReference? userToUnfriend,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('Unfriend_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'friends': FieldValue.arrayRemove([userToUnfriend]),
      'friends_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('Unfriend_backend_call');

    firestoreBatch.update(userToUnfriend!, {
      'friends': FieldValue.arrayRemove([currentUserReference]),
      'friends_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('Unfriend_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Removed friend',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } finally {
    await firestoreBatch.commit();
  }
}

Future unfollowMusican(
  BuildContext context, {
  required DocumentReference? accountToUnfollow,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('UnfollowMusican_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'following': FieldValue.arrayRemove([accountToUnfollow]),
      'following_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('UnfollowMusican_backend_call');

    firestoreBatch.update(accountToUnfollow!, {
      'fans': FieldValue.arrayRemove([currentUserReference]),
      'fan_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('UnfollowMusican_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Artist unfollowed',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } finally {
    await firestoreBatch.commit();
  }
}

Future removeFanFollower(
  BuildContext context, {
  required DocumentReference? fanToRemove,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('RemoveFanFollower_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'fans': FieldValue.arrayRemove([fanToRemove]),
      'fan_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('RemoveFanFollower_backend_call');

    firestoreBatch.update(fanToRemove!, {
      'following_count': FieldValue.increment(-(1)),
      'following': FieldValue.arrayRemove([currentUserReference]),
    });
    logFirebaseEvent('RemoveFanFollower_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Removed follower',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } finally {
    await firestoreBatch.commit();
  }
}

Future notifyUser(
  BuildContext context, {
  required DocumentReference? userToNotify,
  required String? notificationType,
  required String? notificationBody,
}) async {
  logFirebaseEvent('NotifyUser_backend_call');

  await userToNotify!.update({
    'notifications': FieldValue.arrayUnion([
      getNotificationFirestoreData(
        createNotificationStruct(
          notificationType: notificationType,
          notificationTime: getCurrentTimestamp,
          notificationUser: currentUserReference,
          notificationBody: notificationBody,
          clearUnsetFields: false,
        ),
        true,
      )
    ]),
  });
}

Future followMusician(
  BuildContext context, {
  required DocumentReference? musicianToFollow,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('FollowMusician_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'following': FieldValue.arrayUnion([musicianToFollow]),
      'following_count': FieldValue.increment(1),
    });
    logFirebaseEvent('FollowMusician_backend_call');

    firestoreBatch.update(musicianToFollow!, {
      'fans': FieldValue.arrayUnion([currentUserReference]),
      'fan_count': FieldValue.increment(1),
    });
    logFirebaseEvent('FollowMusician_action_block');
    await action_blocks.notifyUser(
      context,
      userToNotify: musicianToFollow,
      notificationType: 'new_follower',
      notificationBody: 'started following you',
    );
    logFirebaseEvent('FollowMusician_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Followed artist',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } finally {
    await firestoreBatch.commit();
  }
}

Future acceptFriendRequest(
  BuildContext context, {
  required DocumentReference? friendToAdd,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('AcceptFriendRequest_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'friends': FieldValue.arrayUnion([friendToAdd]),
      'friends_count': FieldValue.increment(1),
    });
    logFirebaseEvent('AcceptFriendRequest_backend_call');

    firestoreBatch.update(friendToAdd!, {
      'friends': FieldValue.arrayUnion([currentUserReference]),
      'friends_count': FieldValue.increment(1),
    });
    logFirebaseEvent('AcceptFriendRequest_action_block');
    await action_blocks.notifyUser(
      context,
      userToNotify: friendToAdd,
      notificationType: 'friend_request_accept',
      notificationBody: 'accepted your friend request',
    );
    logFirebaseEvent('AcceptFriendRequest_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added friend',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } finally {
    await firestoreBatch.commit();
  }
}
