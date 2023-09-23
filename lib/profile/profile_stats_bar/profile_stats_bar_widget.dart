import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_stats_bar_model.dart';
export 'profile_stats_bar_model.dart';

class ProfileStatsBarWidget extends StatefulWidget {
  const ProfileStatsBarWidget({
    Key? key,
    required this.userToDisplayDataFor,
  }) : super(key: key);

  final UsersRecord? userToDisplayDataFor;

  @override
  _ProfileStatsBarWidgetState createState() => _ProfileStatsBarWidgetState();
}

class _ProfileStatsBarWidgetState extends State<ProfileStatsBarWidget> {
  late ProfileStatsBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStatsBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_STATS_BAR_ProfileStatsBar_ON_INI');
      if (widget.userToDisplayDataFor?.reference == currentUserReference) {
        return;
      }

      logFirebaseEvent('ProfileStatsBar_action_block');
      _model.userFollowsUser = await action_blocks.isFollowing(
        context,
        followingUser: currentUserReference,
        followedUser: widget.userToDisplayDataFor?.reference,
      );
      logFirebaseEvent('ProfileStatsBar_update_widget_state');
      setState(() {
        _model.userFollowsThisAccount = _model.userFollowsUser!;
      });
      return;
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('PROFILE_STATS_BAR_Container_pjplerah_ON_');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(
                  'UserListPage',
                  queryParameters: {
                    'titleText': serializeParam(
                      'Followers',
                      ParamType.String,
                    ),
                    'account': serializeParam(
                      widget.userToDisplayDataFor?.reference,
                      ParamType.DocumentReference,
                    ),
                    'queryType': serializeParam(
                      'Followers',
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(
                  color: Color(0x00292B33),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          widget.userToDisplayDataFor?.followerCount,
                          formatType: FormatType.compact,
                        ),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      'Followers',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PROFILE_STATS_BAR_Container_rup5cm1w_ON_');
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    'UserListPage',
                    queryParameters: {
                      'titleText': serializeParam(
                        'Following',
                        ParamType.String,
                      ),
                      'account': serializeParam(
                        widget.userToDisplayDataFor?.reference,
                        ParamType.DocumentReference,
                      ),
                      'queryType': serializeParam(
                        'Following',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  decoration: BoxDecoration(
                    color: Color(0x00292B33),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          formatNumber(
                            widget.userToDisplayDataFor?.followingCount,
                            formatType: FormatType.compact,
                          ),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        'Following',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              if (widget.userToDisplayDataFor?.reference ==
                  currentUserReference)
                FFButtonWidget(
                  onPressed: () {
                    print('GoLiveButton pressed ...');
                  },
                  text: 'Go Live',
                  icon: FaIcon(
                    FontAwesomeIcons.video,
                  ),
                  options: FFButtonOptions(
                    width: 115.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              if (!_model.userFollowsThisAccount &&
                  (widget.userToDisplayDataFor?.reference !=
                      currentUserReference))
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PROFILE_STATS_BAR_FollowButton_ON_TAP');
                    logFirebaseEvent('FollowButton_action_block');
                    await action_blocks.followUser(
                      context,
                      userToFollow: widget.userToDisplayDataFor?.reference,
                    );
                    setState(() {});
                    logFirebaseEvent('FollowButton_update_widget_state');
                    setState(() {
                      _model.userFollowsThisAccount = true;
                    });
                  },
                  text: 'Follow',
                  icon: Icon(
                    Icons.person_add,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 115.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              if (_model.userFollowsThisAccount &&
                  (widget.userToDisplayDataFor?.reference !=
                      currentUserReference))
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PROFILE_STATS_BAR_UnfollowButton_ON_TAP');
                    logFirebaseEvent('UnfollowButton_action_block');
                    await action_blocks.unfollowUser(
                      context,
                      userToUnfollow: widget.userToDisplayDataFor?.reference,
                    );
                    setState(() {});
                    logFirebaseEvent('UnfollowButton_update_widget_state');
                    setState(() {
                      _model.userFollowsThisAccount = false;
                    });
                  },
                  text: 'Unfollow',
                  options: FFButtonOptions(
                    width: 115.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x006542DC),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).alternate,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
            ],
          ),
        ].addToStart(SizedBox(width: 20.0)).addToEnd(SizedBox(width: 20.0)),
      ),
    );
  }
}
