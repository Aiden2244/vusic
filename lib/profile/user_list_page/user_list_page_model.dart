import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'user_list_page_widget.dart' show UserListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListPageModel extends FlutterFlowModel<UserListPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listOfUserRefs = [];
  void addToListOfUserRefs(DocumentReference item) => listOfUserRefs.add(item);
  void removeFromListOfUserRefs(DocumentReference item) =>
      listOfUserRefs.remove(item);
  void removeAtIndexFromListOfUserRefs(int index) =>
      listOfUserRefs.removeAt(index);
  void insertAtIndexInListOfUserRefs(int index, DocumentReference item) =>
      listOfUserRefs.insert(index, item);
  void updateListOfUserRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listOfUserRefs[index] = updateFn(listOfUserRefs[index]);

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
