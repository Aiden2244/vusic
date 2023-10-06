import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/profile_stats_bar/profile_stats_bar_widget.dart';
import 'other_user_p_f_p_widget.dart' show OtherUserPFPWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherUserPFPModel extends FlutterFlowModel<OtherUserPFPWidget> {
  ///  Local state fields for this page.

  UsersRecord? pageUser;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ProfileStatsBar component.
  late ProfileStatsBarModel profileStatsBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profileStatsBarModel = createModel(context, () => ProfileStatsBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    profileStatsBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
