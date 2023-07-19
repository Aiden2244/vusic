import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SetUnamePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 50) {
      return 'Name cannot exceed 50 characters';
    }

    return null;
  }

  // State field(s) for UnameField widget.
  TextEditingController? unameFieldController;
  String? Function(BuildContext, String?)? unameFieldControllerValidator;
  String? _unameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Username must be at least 6 charaters';
    }
    if (val.length > 20) {
      return 'Username cannot be longer than 20 characters';
    }
    if (!RegExp('^[a-z][a-z0-9_.]{5,19}\$').hasMatch(val)) {
      return 'Username is not valid';
    }
    return null;
  }

  // State field(s) for PhoneField widget.
  TextEditingController? phoneFieldController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  String? _phoneFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 0) {
      return 'Requires at least 0 characters.';
    }

    if (!RegExp('^\\(\\d{3}\\)\\s\\d{3}-\\d{4}\$').hasMatch(val)) {
      return 'Phone number is not valid';
    }
    return null;
  }

  // State field(s) for AccountMenu widget.
  String? accountMenuValue;
  FormFieldController<String>? accountMenuValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    unameFieldControllerValidator = _unameFieldControllerValidator;
    phoneFieldControllerValidator = _phoneFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
    unameFieldController?.dispose();
    phoneFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
