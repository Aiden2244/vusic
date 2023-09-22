import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListViewModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<FollowsRecord> followsDocRefList = [];
  void addToFollowsDocRefList(FollowsRecord item) =>
      followsDocRefList.add(item);
  void removeFromFollowsDocRefList(FollowsRecord item) =>
      followsDocRefList.remove(item);
  void removeAtIndexFromFollowsDocRefList(int index) =>
      followsDocRefList.removeAt(index);
  void updateFollowsDocRefListAtIndex(
          int index, Function(FollowsRecord) updateFn) =>
      followsDocRefList[index] = updateFn(followsDocRefList[index]);

  int followDocCount = 0;

  List<DocumentReference> usersToDisplay = [];
  void addToUsersToDisplay(DocumentReference item) => usersToDisplay.add(item);
  void removeFromUsersToDisplay(DocumentReference item) =>
      usersToDisplay.remove(item);
  void removeAtIndexFromUsersToDisplay(int index) =>
      usersToDisplay.removeAt(index);
  void updateUsersToDisplayAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersToDisplay[index] = updateFn(usersToDisplay[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  Future<DocumentReference> extractUserFromFollowsDoc(
    BuildContext context, {
    required FollowsRecord? followsDoc,
    required bool? returnFollowerID,
  }) async {
    if (returnFollowerID == true) {
      return followsDoc?.followerID;
    }

    return followsDoc?.followingID;
  }

  /// Additional helper methods are added here.
}
