import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/notification_tile/notification_tile_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for NotificationTile dynamic component.
  late FlutterFlowDynamicModels<NotificationTileModel> notificationTileModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notificationTileModels =
        FlutterFlowDynamicModels(() => NotificationTileModel());
  }

  void dispose() {
    unfocusNode.dispose();
    notificationTileModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
