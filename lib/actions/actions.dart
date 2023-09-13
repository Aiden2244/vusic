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
    logFirebaseEvent('Unfriend_alert_dialog');
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Unfriend'),
              content: Text(
                  'Are you sure you want to unfriend this user? They will not be notified that you removed them.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Unfriend'),
                ),
              ],
            );
          },
        ) ??
        false;
    logFirebaseEvent('Unfriend_action_block');
    await action_blocks.deleteRelationship(
      context,
      userToRemoveDocumentFrom: userToUnfriend,
      userToRemove: currentUserReference,
    );
    logFirebaseEvent('Unfriend_backend_call');

    firestoreBatch.update(userToUnfriend!, {
      'friends_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('Unfriend_backend_call');

    firestoreBatch.update(currentUserReference!, {
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
    logFirebaseEvent('UnfollowMusican_alert_dialog');
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Unfollow Artist'),
              content: Text(
                  'Are you sure you want to unfollow this artist? They will not be notified that you removed them.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Unfollow'),
                ),
              ],
            );
          },
        ) ??
        false;
    logFirebaseEvent('UnfollowMusican_action_block');
    await action_blocks.deleteRelationship(
      context,
      userToRemoveDocumentFrom: accountToUnfollow,
      userToRemove: currentUserReference,
    );
    logFirebaseEvent('UnfollowMusican_backend_call');

    firestoreBatch.update(accountToUnfollow!, {
      'fan_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('UnfollowMusican_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'following_count': FieldValue.increment(-(1)),
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
    logFirebaseEvent('RemoveFanFollower_alert_dialog');
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Remove Fan'),
              content: Text(
                  'Are you sure you want to remove this fan? They will not be notified that you removed them.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Remove Fan'),
                ),
              ],
            );
          },
        ) ??
        false;
    logFirebaseEvent('RemoveFanFollower_action_block');
    await action_blocks.deleteRelationship(
      context,
      userToRemoveDocumentFrom: fanToRemove,
      userToRemove: currentUserReference,
    );
    logFirebaseEvent('RemoveFanFollower_backend_call');

    firestoreBatch.update(fanToRemove!, {
      'following_count': FieldValue.increment(-(1)),
    });
    logFirebaseEvent('RemoveFanFollower_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'fan_count': FieldValue.increment(-(1)),
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
  required DocumentReference? senderRef,
}) async {
  logFirebaseEvent('NotifyUser_backend_call');

  await NotificationsRecord.createDoc(userToNotify!)
      .set(createNotificationsRecordData(
    recipientRef: userToNotify,
    senderRef: senderRef,
    nofiticationType: notificationType,
    notificationCreatedTime: getCurrentTimestamp,
    notificationText: notificationBody,
  ));
}

Future followMusician(
  BuildContext context, {
  required DocumentReference? musicianToFollow,
}) async {
  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    logFirebaseEvent('FollowMusician_action_block');
    await action_blocks.createRelationship(
      context,
      relationshipType: 'fan',
      userToAdd: currentUserReference,
      userToCreateDocumentFor: musicianToFollow,
    );
    logFirebaseEvent('FollowMusician_action_block');
    await action_blocks.createRelationship(
      context,
      relationshipType: 'following',
      userToAdd: musicianToFollow,
      userToCreateDocumentFor: currentUserReference,
    );
    logFirebaseEvent('FollowMusician_action_block');
    await action_blocks.notifyUser(
      context,
      userToNotify: musicianToFollow,
      notificationType: 'new_follower',
      notificationBody: 'started following you',
      senderRef: currentUserReference,
    );
    logFirebaseEvent('FollowMusician_backend_call');

    firestoreBatch.update(musicianToFollow!, {
      'fan_count': FieldValue.increment(1),
    });
    logFirebaseEvent('FollowMusician_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'following_count': FieldValue.increment(1),
    });
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
    logFirebaseEvent('AcceptFriendRequest_action_block');
    await action_blocks.createRelationship(
      context,
      relationshipType: 'friend',
      userToAdd: friendToAdd,
      userToCreateDocumentFor: currentUserReference,
    );
    logFirebaseEvent('AcceptFriendRequest_action_block');
    await action_blocks.notifyUser(
      context,
      userToNotify: friendToAdd,
      notificationType: 'friend_request_accept',
      notificationBody: 'accepted your friend request',
      senderRef: currentUserReference,
    );
    logFirebaseEvent('AcceptFriendRequest_action_block');
    await action_blocks.deleteNotification(
      context,
      senderRef: friendToAdd,
      notificationType: 'friend_request',
    );
    logFirebaseEvent('AcceptFriendRequest_backend_call');

    firestoreBatch.update(currentUserReference!, {
      'requested_friends': FieldValue.arrayRemove([friendToAdd]),
      'friends_count': FieldValue.increment(1),
    });
    logFirebaseEvent('AcceptFriendRequest_backend_call');

    firestoreBatch.update(friendToAdd!, {
      'friends_count': FieldValue.increment(1),
    });
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

Future deleteNotification(
  BuildContext context, {
  required DocumentReference? senderRef,
  required String? notificationType,
}) async {
  NotificationsRecord? notificationToDelete;

  logFirebaseEvent('DeleteNotification_firestore_query');
  notificationToDelete = await queryNotificationsRecordOnce(
    parent: currentUserReference,
    queryBuilder: (notificationsRecord) => notificationsRecord
        .where('sender_ref', isEqualTo: senderRef)
        .where('nofitication_type', isEqualTo: notificationType),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  logFirebaseEvent('DeleteNotification_backend_call');
  await notificationToDelete!.reference.delete();
}

Future createRelationship(
  BuildContext context, {
  required String? relationshipType,
  required DocumentReference? userToAdd,
  required DocumentReference? userToCreateDocumentFor,
}) async {
  logFirebaseEvent('CreateRelationship_backend_call');

  await RelationshipsRecord.createDoc(userToCreateDocumentFor!)
      .set(createRelationshipsRecordData(
    relationshipRef: userToAdd,
    relationshipType: relationshipType,
    relationshipCreated: getCurrentTimestamp,
  ));
}

Future deleteRelationship(
  BuildContext context, {
  required DocumentReference? userToRemoveDocumentFrom,
  required DocumentReference? userToRemove,
}) async {
  RelationshipsRecord? documentToDelete1;
  RelationshipsRecord? documentToDelete;

  logFirebaseEvent('DeleteRelationship_firestore_query');
  documentToDelete1 = await queryRelationshipsRecordOnce(
    parent: userToRemoveDocumentFrom,
    queryBuilder: (relationshipsRecord) =>
        relationshipsRecord.where('relationship_ref', isEqualTo: userToRemove),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  logFirebaseEvent('DeleteRelationship_backend_call');
  await documentToDelete1!.reference.delete();
  logFirebaseEvent('DeleteRelationship_firestore_query');
  documentToDelete = await queryRelationshipsRecordOnce(
    parent: userToRemove,
    queryBuilder: (relationshipsRecord) => relationshipsRecord
        .where('relationship_ref', isEqualTo: userToRemoveDocumentFrom),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  logFirebaseEvent('DeleteRelationship_backend_call');
  await documentToDelete!.reference.delete();
}
