import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future followUser(
  BuildContext context, {
  required DocumentReference? userToFollow,
}) async {
  logFirebaseEvent('FollowUser_backend_call');

  await FollowsRecord.collection.doc().set(createFollowsRecordData(
        followerID: userToFollow,
        followingID: currentUserReference,
      ));
  logFirebaseEvent('FollowUser_action_block');
  await action_blocks.updateFollowerCount(
    context,
    userRef: userToFollow,
    decrement: false,
  );
  logFirebaseEvent('FollowUser_action_block');
  await action_blocks.updateFollowingCount(
    context,
    userRef: currentUserReference,
    decrement: false,
  );
  logFirebaseEvent('FollowUser_action_block');
  await action_blocks.createNotification(
    context,
    recipient: userToFollow,
    sender: currentUserReference,
    type: 'new_follower',
    notificationBody: 'started following you',
    senderUserName: valueOrDefault(currentUserDocument?.userName, ''),
    senderPFP: currentUserPhoto,
  );
  logFirebaseEvent('FollowUser_show_snack_bar');
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'User followed successfully!',
        style: TextStyle(),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );
}

Future createNotification(
  BuildContext context, {
  required DocumentReference? recipient,
  DocumentReference? sender,
  required String? type,
  required String? notificationBody,
  DocumentReference? postRef,
  DocumentReference? commentRef,
  String? senderUserName,
  String? senderPFP,
}) async {
  NotificationsRecord? newNotification;

  logFirebaseEvent('CreateNotification_backend_call');

  var notificationsRecordReference = NotificationsRecord.collection.doc();
  await notificationsRecordReference.set(createNotificationsRecordData(
    recipientRef: recipient,
    senderRef: sender,
    type: type,
    createdAt: getCurrentTimestamp,
    isRead: false,
    notificationBody: notificationBody,
    postRef: postRef,
    commentRef: commentRef,
    senderUsername: senderUserName,
    senderPfp: senderPFP,
  ));
  newNotification = NotificationsRecord.getDocumentFromData(
      createNotificationsRecordData(
        recipientRef: recipient,
        senderRef: sender,
        type: type,
        createdAt: getCurrentTimestamp,
        isRead: false,
        notificationBody: notificationBody,
        postRef: postRef,
        commentRef: commentRef,
        senderUsername: senderUserName,
        senderPfp: senderPFP,
      ),
      notificationsRecordReference);
}

Future updateFollowingCount(
  BuildContext context, {
  required DocumentReference? userRef,
  required bool? decrement,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    if (decrement == true) {
      logFirebaseEvent('UpdateFollowingCount_backend_call');

      firestoreBatch.update(userRef!, {
        'following_count': FieldValue.increment(-(1)),
      });
    } else {
      logFirebaseEvent('UpdateFollowingCount_backend_call');

      firestoreBatch.update(userRef!, {
        'following_count': FieldValue.increment(1),
      });
    }
  } finally {
    await firestoreBatch.commit();
  }
}

Future updateFollowerCount(
  BuildContext context, {
  required DocumentReference? userRef,
  required bool? decrement,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    if (decrement == true) {
      logFirebaseEvent('UpdateFollowerCount_backend_call');

      firestoreBatch.update(userRef!, {
        'follower_count': FieldValue.increment(-(1)),
      });
    } else {
      logFirebaseEvent('UpdateFollowerCount_backend_call');

      firestoreBatch.update(userRef!, {
        'follower_count': FieldValue.increment(1),
      });
    }
  } finally {
    await firestoreBatch.commit();
  }
}

Future<bool?> isFollowing(
  BuildContext context, {
  required DocumentReference? followingUser,
  required DocumentReference? followedUser,
}) async {
  FollowsRecord? followingDoc;

  logFirebaseEvent('IsFollowing_firestore_query');
  followingDoc = await queryFollowsRecordOnce(
    queryBuilder: (followsRecord) => followsRecord
        .where('followerID', isEqualTo: followedUser)
        .where('followingID', isEqualTo: followingUser),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  return followingDoc != null;
}

Future unfollowUser(
  BuildContext context, {
  required DocumentReference? userToUnfollow,
}) async {
  DocumentReference? followingDoc;

  logFirebaseEvent('UnfollowUser_action_block');
  await action_blocks.updateFollowerCount(
    context,
    userRef: userToUnfollow,
    decrement: true,
  );
  logFirebaseEvent('UnfollowUser_action_block');
  await action_blocks.updateFollowingCount(
    context,
    userRef: currentUserReference,
    decrement: true,
  );
  logFirebaseEvent('UnfollowUser_action_block');
  followingDoc = await action_blocks.getFollowsDocRef(
    context,
    followedUser: userToUnfollow,
    followingUser: currentUserReference,
  );
  logFirebaseEvent('UnfollowUser_backend_call');
  await followingDoc!.delete();
  logFirebaseEvent('UnfollowUser_show_snack_bar');
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'User unfolloweed',
        style: TextStyle(),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );
}

Future<DocumentReference?> getFollowsDocRef(
  BuildContext context, {
  required DocumentReference? followedUser,
  required DocumentReference? followingUser,
}) async {
  FollowsRecord? followingDoc;

  logFirebaseEvent('GetFollowsDocRef_firestore_query');
  followingDoc = await queryFollowsRecordOnce(
    queryBuilder: (followsRecord) => followsRecord
        .where('followerID', isEqualTo: followedUser)
        .where('followingID', isEqualTo: followingUser),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  return followingDoc?.reference;
}

Future removeFollower(
  BuildContext context, {
  required DocumentReference? userToRemove,
}) async {
  DocumentReference? followingDoc;

  logFirebaseEvent('RemoveFollower_alert_dialog');
  var confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Remove Follower'),
            content: Text(
                'Are you sure you want to remove this user as a follower (they will not be notified that you removed them)?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, true),
                child: Text('Remove Follower'),
              ),
            ],
          );
        },
      ) ??
      false;
  logFirebaseEvent('RemoveFollower_action_block');
  await action_blocks.updateFollowerCount(
    context,
    userRef: currentUserReference,
    decrement: true,
  );
  logFirebaseEvent('RemoveFollower_action_block');
  await action_blocks.updateFollowingCount(
    context,
    userRef: userToRemove,
    decrement: true,
  );
  logFirebaseEvent('RemoveFollower_action_block');
  followingDoc = await action_blocks.getFollowsDocRef(
    context,
    followedUser: currentUserReference,
    followingUser: userToRemove,
  );
  logFirebaseEvent('RemoveFollower_backend_call');
  await followingDoc!.delete();
  logFirebaseEvent('RemoveFollower_show_snack_bar');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'User removed as a follower',
        style: TextStyle(),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );
}

Future<UsersRecord?> getUserFromReference(
  BuildContext context, {
  required DocumentReference? userToGet,
}) async {
  UsersRecord? userDoc;

  logFirebaseEvent('GetUserFromReference_firestore_query');
  userDoc = await queryUsersRecordOnce(
    queryBuilder: (usersRecord) =>
        usersRecord.where('uid', isEqualTo: userToGet?.id),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  return userDoc;
}
