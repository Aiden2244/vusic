import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/profile/auth_user_fan_bar/auth_user_fan_bar_widget.dart';
import '/profile/auth_user_musician_bar/auth_user_musician_bar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DocumentReference? pageUser;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AuthUserFanBar component.
  late AuthUserFanBarModel authUserFanBarModel;
  // Model for AuthUserMusicianBar component.
  late AuthUserMusicianBarModel authUserMusicianBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authUserFanBarModel = createModel(context, () => AuthUserFanBarModel());
    authUserMusicianBarModel =
        createModel(context, () => AuthUserMusicianBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authUserFanBarModel.dispose();
    authUserMusicianBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
