import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherUserPFPModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int count1 = 0;

  int count2 = 0;

  String label1 = 'Following';

  String label2 = 'Friends';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in OtherUserPFP widget.
  int? friendsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherUserPFP widget.
  int? followingCoun;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherUserPFP widget.
  int? fansCount;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
