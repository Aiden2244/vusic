import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListViewModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<DocumentReference> listToShow = [];
  void addToListToShow(DocumentReference item) => listToShow.add(item);
  void removeFromListToShow(DocumentReference item) => listToShow.remove(item);
  void removeAtIndexFromListToShow(int index) => listToShow.removeAt(index);
  void updateListToShowAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listToShow[index] = updateFn(listToShow[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in UserListView widget.
  List<FriendsRecord>? friendsList;
  // Stores action output result for [Firestore Query - Query a collection] action in UserListView widget.
  List<FansRecord>? fansList;
  // Stores action output result for [Firestore Query - Query a collection] action in UserListView widget.
  List<FollowingRecord>? followingList;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
