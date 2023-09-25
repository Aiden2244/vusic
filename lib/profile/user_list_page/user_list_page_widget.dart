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
import 'user_list_page_model.dart';
export 'user_list_page_model.dart';

class UserListPageWidget extends StatefulWidget {
  const UserListPageWidget({
    Key? key,
    required this.titleText,
    required this.account,
    required this.queryType,
  }) : super(key: key);

  final String? titleText;
  final DocumentReference? account;
  final String? queryType;

  @override
  _UserListPageWidgetState createState() => _UserListPageWidgetState();
}

class _UserListPageWidgetState extends State<UserListPageWidget> {
  late UserListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UserListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_LIST_UserListPage_ON_INIT_STATE');
      if (widget.queryType == 'Following') {
        logFirebaseEvent('UserListPage_firestore_query');
        _model.usersYouFollow = await queryFollowsRecordOnce(
          queryBuilder: (followsRecord) =>
              followsRecord.where('followingID', isEqualTo: widget.account),
          limit: 100,
        );
        logFirebaseEvent('UserListPage_update_widget_state');
        setState(() {
          _model.listOfFollows =
              _model.usersYouFollow!.toList().cast<FollowsRecord>();
        });
      } else {
        logFirebaseEvent('UserListPage_firestore_query');
        _model.usersFollowingYou = await queryFollowsRecordOnce(
          queryBuilder: (followsRecord) =>
              followsRecord.where('followedID', isEqualTo: widget.account),
          limit: 100,
        );
        logFirebaseEvent('UserListPage_update_widget_state');
        setState(() {
          _model.listOfFollows =
              _model.usersFollowingYou!.toList().cast<FollowsRecord>();
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('USER_LIST_arrow_back_rounded_ICN_ON_TAP');
              if (widget.account == currentUserReference) {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('ProfilePage');
              } else {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(
                  'OtherUserPFP',
                  queryParameters: {
                    'pageUserRef': serializeParam(
                      widget.account,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              }
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.titleText,
              'Friends',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.listOfFollows.length > 0,
            child: Builder(
              builder: (context) {
                final listOfFollowsPassedInListView =
                    _model.listOfFollows.toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listOfFollowsPassedInListView.length,
                  itemBuilder: (context, listOfFollowsPassedInListViewIndex) {
                    final listOfFollowsPassedInListViewItem =
                        listOfFollowsPassedInListView[
                            listOfFollowsPassedInListViewIndex];
                    return UserListViewWidget(
                      key: Key(
                          'Keyh7p_${listOfFollowsPassedInListViewIndex}_of_${listOfFollowsPassedInListView.length}'),
                      queryType: widget.queryType!,
                      userAccount: widget.account!,
                      followsDoc: listOfFollowsPassedInListViewItem,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
