import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_list_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  UsersRecord? listToShow;

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
