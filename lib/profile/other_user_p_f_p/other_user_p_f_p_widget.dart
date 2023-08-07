import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'other_user_p_f_p_model.dart';
export 'other_user_p_f_p_model.dart';

class OtherUserPFPWidget extends StatefulWidget {
  const OtherUserPFPWidget({
    Key? key,
    required this.pageUser,
    required this.pageAccountType,
    int? followingCount,
    int? fanCount,
    int? friendCount,
  })  : this.followingCount = followingCount ?? 0,
        this.fanCount = fanCount ?? 0,
        this.friendCount = friendCount ?? 0,
        super(key: key);

  final DocumentReference? pageUser;
  final String? pageAccountType;
  final int followingCount;
  final int fanCount;
  final int friendCount;

  @override
  _OtherUserPFPWidgetState createState() => _OtherUserPFPWidgetState();
}

class _OtherUserPFPWidgetState extends State<OtherUserPFPWidget> {
  late OtherUserPFPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherUserPFPModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OtherUserPFP'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OTHER_USER_P_F_P_OtherUserPFP_ON_INIT_ST');
      logFirebaseEvent('OtherUserPFP_action_block');
      await action_blocks.updateCurrentPage(context);
      if (widget.pageAccountType == 'fan') {
        logFirebaseEvent('OtherUserPFP_update_widget_state');
        setState(() {
          _model.count1 = widget.followingCount;
          _model.label1 = 'Following';
          _model.count2 = widget.friendCount;
          _model.label2 = 'Friends';
        });
      } else {
        logFirebaseEvent('OtherUserPFP_update_widget_state');
        setState(() {
          _model.count1 = widget.fanCount;
          _model.label1 = 'Fans';
          _model.count2 = widget.friendCount;
          _model.label2 = 'Mutuals';
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

    return FutureBuilder<UsersRecord>(
      future: UsersRecord.getDocumentOnce(widget.pageUser!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final otherUserPFPUsersRecord = snapshot.data!;
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
                  logFirebaseEvent('OTHER_USER_P_F_P_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'SampleThemeTest',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                      ),
                    },
                  );
                },
              ),
              title: Text(
                otherUserPFPUsersRecord.userName,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: Stack(
                        children: [
                          if ((valueOrDefault(
                                          currentUserDocument?.backsplashVideo,
                                          '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument?.backsplashVideo,
                                          '') ==
                                      '') ||
                              (valueOrDefault(
                                      currentUserDocument?.backsplashVideo,
                                      '') ==
                                  'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4'))
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      otherUserPFPUsersRecord.backsplashPic,
                                      'https://images.unsplash.com/photo-1548502632-6b93092aad0b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxtdXNpYyUyMHN0dWRpb3xlbnwwfHx8fDE2ODk2MjAxODF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                    ),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.26,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          if ((valueOrDefault(
                                          currentUserDocument?.backsplashVideo,
                                          '') !=
                                      null &&
                                  valueOrDefault(
                                          currentUserDocument?.backsplashVideo,
                                          '') !=
                                      '') ||
                              (valueOrDefault(
                                      currentUserDocument?.backsplashVideo,
                                      '') !=
                                  'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4'))
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FlutterFlowVideoPlayer(
                                  path: valueOrDefault<String>(
                                    otherUserPFPUsersRecord.backsplashVideo,
                                    'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                  ),
                                  videoType: VideoType.network,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.26,
                                  autoPlay: true,
                                  looping: true,
                                  showControls: false,
                                  allowFullScreen: false,
                                  allowPlaybackSpeedMenu: false,
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 2.47),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          otherUserPFPUsersRecord.photoUrl,
                                          'https://firebasestorage.googleapis.com/v0/b/vusic-final-c44ec.appspot.com/o/Vusic%20Logo%20Large.png?alt=media&token=7bd3dcee-5a03-4dd5-89b4-17f4fcc67dbc',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0x006542DC),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    Text(
                                      otherUserPFPUsersRecord.userName,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Visibility(
                                        visible: otherUserPFPUsersRecord
                                                .isVerified ==
                                            true,
                                        child: Icon(
                                          Icons.verified,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 80.0,
                      thickness: 1.0,
                      color: Color(0x006542DC),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          otherUserPFPUsersRecord.bio,
                          'Follow my band on VUSIC!',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      indent: 10.0,
                      endIndent: 10.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (((currentUserDocument?.friends?.toList() ?? [])
                                      .contains(
                                          otherUserPFPUsersRecord.reference) ==
                                  false) &&
                              (valueOrDefault(
                                      currentUserDocument?.accountType, '') ==
                                  'fan'))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'OTHER_USER_P_F_P_FriendButton_ON_TAP');
                                    logFirebaseEvent(
                                        'FriendButton_action_block');
                                    await action_blocks.notifyUser(
                                      context,
                                      userToNotify:
                                          otherUserPFPUsersRecord.reference,
                                      notificationType: 'friend_request',
                                      notificationBody:
                                          'sent you a friend request',
                                    );
                                    logFirebaseEvent(
                                        'FriendButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Friend request sent',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                  text: 'Friend',
                                  icon: Icon(
                                    Icons.person_add,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 115.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                          if (((currentUserDocument?.friends?.toList() ?? [])
                                      .contains(
                                          otherUserPFPUsersRecord.reference) ==
                                  true) &&
                              (valueOrDefault(
                                      currentUserDocument?.accountType, '') ==
                                  'fan'))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'OTHER_USER_P_F_P_UnfriendButton_ON_TAP');
                                    logFirebaseEvent(
                                        'UnfriendButton_action_block');
                                    await action_blocks.unfriend(
                                      context,
                                      userToUnfriend:
                                          otherUserPFPUsersRecord.reference,
                                    );
                                    setState(() {});
                                  },
                                  text: 'Unfriend',
                                  options: FFButtonOptions(
                                    width: 115.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x006542DC),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 4.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
