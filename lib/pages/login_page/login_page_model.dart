import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for PassField widget.
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passFieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFieldController?.dispose();
    passFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
