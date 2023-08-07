import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/user_list_view/user_list_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<UsersRecord> listToShow = [];
  void addToListToShow(UsersRecord item) => listToShow.add(item);
  void removeFromListToShow(UsersRecord item) => listToShow.remove(item);
  void removeAtIndexFromListToShow(int index) => listToShow.removeAt(index);
  void updateListToShowAtIndex(int index, Function(UsersRecord) updateFn) =>
      listToShow[index] = updateFn(listToShow[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserListView component.
  late UserListViewModel userListViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userListViewModel = createModel(context, () => UserListViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userListViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
