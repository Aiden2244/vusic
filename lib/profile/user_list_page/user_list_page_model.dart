import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/user_list_view/user_list_view_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<FollowsRecord> listOfFollows = [];
  void addToListOfFollows(FollowsRecord item) => listOfFollows.add(item);
  void removeFromListOfFollows(FollowsRecord item) =>
      listOfFollows.remove(item);
  void removeAtIndexFromListOfFollows(int index) =>
      listOfFollows.removeAt(index);
  void updateListOfFollowsAtIndex(
          int index, Function(FollowsRecord) updateFn) =>
      listOfFollows[index] = updateFn(listOfFollows[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in UserListPage widget.
  List<FollowsRecord>? usersYouFollow;
  // Stores action output result for [Firestore Query - Query a collection] action in UserListPage widget.
  List<FollowsRecord>? usersFollowingYou;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
