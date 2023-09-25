import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
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
          _model.listOfUserRefs = _model.usersYouFollow!
              .map((e) => e.followedID)
              .withoutNulls
              .toList()
              .toList()
              .cast<DocumentReference>();
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
          _model.listOfUserRefs = _model.usersFollowingYou!
              .map((e) => e.followingID)
              .withoutNulls
              .toList()
              .toList()
              .cast<DocumentReference>();
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
          child: Builder(
            builder: (context) {
              final userRefToProcess =
                  _model.listOfUserRefs.toList().take(20).toList();
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(userRefToProcess.length,
                    (userRefToProcessIndex) {
                  final userRefToProcessItem =
                      userRefToProcess[userRefToProcessIndex];
                  return StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(userRefToProcessItem),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final containerUsersRecord = snapshot.data!;
                      return Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_LIST_CircleImage_74l464b3_ON_TAP');
                                    if (userRefToProcessItem ==
                                        currentUserReference) {
                                      logFirebaseEvent(
                                          'CircleImage_navigate_to');

                                      context.pushNamed('ProfilePage');
                                    } else {
                                      logFirebaseEvent(
                                          'CircleImage_navigate_to');

                                      context.pushNamed(
                                        'OtherUserPFP',
                                        queryParameters: {
                                          'pageUserRef': serializeParam(
                                            userRefToProcessItem,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      containerUsersRecord.photoUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerUsersRecord.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                '@',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  containerUsersRecord.userName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (widget.account == currentUserReference)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 200.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.person_remove,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_LIST_person_remove_ICN_ON_TAP');
                                        if (widget.queryType == 'Following') {
                                          logFirebaseEvent(
                                              'IconButton_action_block');
                                          await action_blocks.unfollowUser(
                                            context,
                                            userToUnfollow:
                                                containerUsersRecord.reference,
                                          );
                                          setState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'IconButton_action_block');
                                          await action_blocks.removeFollower(
                                            context,
                                            userToRemove:
                                                containerUsersRecord.reference,
                                          );
                                          setState(() {});
                                        }

                                        logFirebaseEvent(
                                            'IconButton_update_widget_state');
                                        setState(() {
                                          _model.removeFromListOfUserRefs(
                                              userRefToProcessItem);
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
