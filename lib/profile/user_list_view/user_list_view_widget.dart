import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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
      if ((widget.queryType == 'Friends') || (widget.queryType == 'Mutuals')) {
        logFirebaseEvent('UserListView_firestore_query');
        _model.friendsList = await queryFriendsRecordOnce(
          parent: widget.userAccount,
        );
        logFirebaseEvent('UserListView_update_widget_state');
        _model.listToShow = _model.friendsList!
            .map((e) => e.friendRef)
            .withoutNulls
            .toList()
            .toList()
            .cast<DocumentReference>();
      } else {
        if (widget.queryType == 'Fans') {
          logFirebaseEvent('UserListView_firestore_query');
          _model.fansList = await queryFansRecordOnce(
            parent: widget.userAccount,
          );
          logFirebaseEvent('UserListView_update_widget_state');
          _model.listToShow = _model.fansList!
              .map((e) => e.fanRef)
              .withoutNulls
              .toList()
              .toList()
              .cast<DocumentReference>();
        } else {
          logFirebaseEvent('UserListView_firestore_query');
          _model.followingList = await queryFollowingRecordOnce(
            parent: widget.userAccount,
          );
          logFirebaseEvent('UserListView_update_widget_state');
          _model.listToShow = _model.followingList!
              .map((e) => e.followingRef)
              .withoutNulls
              .toList()
              .toList()
              .cast<DocumentReference>();
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

    return Builder(
      builder: (context) {
        final usersQuery = _model.listToShow.toList();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(usersQuery.length, (usersQueryIndex) {
              final usersQueryItem = usersQuery[usersQueryIndex];
              return StreamBuilder<UsersRecord>(
                stream:
                    UsersRecord.getDocument(_model.listToShow[usersQueryIndex]),
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
                                    'USER_LIST_VIEW_CircleImage_r98vbcmv_ON_T');
                                logFirebaseEvent('CircleImage_navigate_to');

                                context.pushNamed(
                                  'OtherUserPFP',
                                  queryParameters: {
                                    'pageUser': serializeParam(
                                      containerUsersRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                    'pageAccountType': serializeParam(
                                      containerUsersRecord.accountType,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            '@',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              containerUsersRecord.userName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                        'USER_LIST_VIEW_person_remove_ICN_ON_TAP');
                                    if (containerUsersRecord.accountType ==
                                        valueOrDefault(
                                            currentUserDocument?.accountType,
                                            '')) {
                                      logFirebaseEvent(
                                          'IconButton_action_block');
                                      await action_blocks.unfriend(
                                        context,
                                        userToUnfriend:
                                            containerUsersRecord.reference,
                                      );
                                      setState(() {});
                                      return;
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument?.accountType,
                                              '') ==
                                          'fan') {
                                        logFirebaseEvent(
                                            'IconButton_action_block');
                                        await action_blocks.unfollowMusican(
                                          context,
                                          accountToUnfollow:
                                              containerUsersRecord.reference,
                                        );
                                        setState(() {});
                                        return;
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_action_block');
                                        await action_blocks.removeFanFollower(
                                          context,
                                          fanToRemove:
                                              containerUsersRecord.reference,
                                        );
                                        setState(() {});
                                        return;
                                      }
                                    }
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
          ),
        );
      },
    );
  }
}