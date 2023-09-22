import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_view_model.dart';
export 'user_list_view_model.dart';

class UserListViewWidget extends StatefulWidget {
  const UserListViewWidget({
    Key? key,
    required this.userAccount,
    required this.queryType,
  }) : super(key: key);

  final DocumentReference? userAccount;
  final String? queryType;

  @override
  _UserListViewWidgetState createState() => _UserListViewWidgetState();
}

class _UserListViewWidgetState extends State<UserListViewWidget> {
  late UserListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_LIST_VIEW_UserListView_ON_INIT_STAT');
      if (widget.queryType == 'Following') {
        logFirebaseEvent('UserListView_firestore_query');
        _model.followingQuery = await queryFollowsRecordOnce(
          queryBuilder: (followsRecord) =>
              followsRecord.where('followingID', isEqualTo: widget.userAccount),
          limit: 15,
        );
        logFirebaseEvent('UserListView_update_widget_state');
        _model.followsDocRefList =
            _model.followingQuery!.toList().cast<FollowsRecord>();
        while (_model.usersToDisplay.length < _model.followsDocRefList.length) {
          logFirebaseEvent('UserListView_action_block');
          _model.followingID = await _model.extractUserFromFollowsDoc(
            context,
            followsDoc: _model.followsDocRefList[_model.followDocCount],
            returnFollowerID: false,
          );
          logFirebaseEvent('UserListView_update_widget_state');
          _model.addToUsersToDisplay(_model.followingID!);
        }
      } else {
        logFirebaseEvent('UserListView_firestore_query');
        _model.followerQuery = await queryFollowsRecordOnce(
          queryBuilder: (followsRecord) =>
              followsRecord.where('followerID', isEqualTo: widget.userAccount),
          limit: 15,
        );
        logFirebaseEvent('UserListView_update_widget_state');
        _model.followsDocRefList =
            _model.followerQuery!.toList().cast<FollowsRecord>();
        while (_model.usersToDisplay.length < _model.followsDocRefList.length) {
          logFirebaseEvent('UserListView_action_block');
          _model.followerID = await _model.extractUserFromFollowsDoc(
            context,
            followsDoc: _model.followsDocRefList[_model.followDocCount],
            returnFollowerID: true,
          );
          logFirebaseEvent('UserListView_update_widget_state');
          _model.addToUsersToDisplay(_model.followerID!);
        }
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder<UsersRecord>(
            future: UsersRecord.getDocumentOnce(widget.userAccount!),
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
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  containerUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        '@',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          containerUsersRecord.userName,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
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
                        if (widget.userAccount == currentUserReference)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 200.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.person_remove,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
