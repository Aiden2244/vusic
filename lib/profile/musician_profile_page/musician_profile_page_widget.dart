import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_profile_page_model.dart';
export 'musician_profile_page_model.dart';

class MusicianProfilePageWidget extends StatefulWidget {
  const MusicianProfilePageWidget({Key? key}) : super(key: key);

  @override
  _MusicianProfilePageWidgetState createState() =>
      _MusicianProfilePageWidgetState();
}

class _MusicianProfilePageWidgetState extends State<MusicianProfilePageWidget> {
  late MusicianProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MusicianProfilePage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(FFAppState().lastSearchedUser!),
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
        final musicianProfilePageUsersRecord = snapshot.data!;
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
                  logFirebaseEvent('MUSICIAN_PROFILE_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                musicianProfilePageUsersRecord.displayName,
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
                                      musicianProfilePageUsersRecord
                                          .backsplashPic,
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
                                    musicianProfilePageUsersRecord
                                        .backsplashVideo,
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
                                          musicianProfilePageUsersRecord
                                              .photoUrl,
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
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            34.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          musicianProfilePageUsersRecord
                                              .userName,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall,
                                        ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isVerified,
                                            false) ==
                                        true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Icon(
                                            Icons.verified,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isVerified,
                                            false) ==
                                        false)
                                      AuthUserStreamWidget(
                                        builder: (context) => SizedBox(
                                          height: 0.0,
                                          child: VerticalDivider(
                                            width: 24.0,
                                            thickness: 1.0,
                                            color: Color(0x006542DC),
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
                          musicianProfilePageUsersRecord.bio,
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
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              decoration: BoxDecoration(
                                color: Color(0x00292B33),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatNumber(
                                      musicianProfilePageUsersRecord.fanCount,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    'Fans',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              decoration: BoxDecoration(
                                color: Color(0x00292B33),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatNumber(
                                      musicianProfilePageUsersRecord
                                          .friendsCount,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    'Friends',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!(currentUserDocument?.following?.toList() ?? [])
                              .contains(
                                  musicianProfilePageUsersRecord.reference))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MUSICIAN_PROFILE_FOLLOW_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');

                                    await currentUserReference!.update({
                                      'following_count':
                                          FieldValue.increment(1),
                                      'following': FieldValue.arrayUnion([
                                        musicianProfilePageUsersRecord.reference
                                      ]),
                                    });
                                    logFirebaseEvent('Button_backend_call');

                                    await musicianProfilePageUsersRecord
                                        .reference
                                        .update({
                                      'fan_count': FieldValue.increment(1),
                                      'fans': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    });
                                  },
                                  text: 'Follow',
                                  icon: Icon(
                                    Icons.play_arrow,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                          if ((currentUserDocument?.following?.toList() ?? [])
                              .contains(
                                  musicianProfilePageUsersRecord.reference))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MUSICIAN_PROFILE_Container_w5bd2mdo_ON_T');
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      logFirebaseEvent(
                                          'Container_backend_call');

                                      firestoreBatch
                                          .update(currentUserReference!, {
                                        'following_count':
                                            FieldValue.increment(-(1)),
                                        'following': FieldValue.arrayRemove([
                                          musicianProfilePageUsersRecord
                                              .reference
                                        ]),
                                      });
                                      logFirebaseEvent(
                                          'Container_backend_call');

                                      firestoreBatch.update(
                                          musicianProfilePageUsersRecord
                                              .reference,
                                          {
                                            'fan_count':
                                                FieldValue.increment(-(1)),
                                            'fans': FieldValue.arrayRemove(
                                                [currentUserReference]),
                                          });
                                    } finally {
                                      await firestoreBatch.commit();
                                    }
                                  },
                                  child: Container(
                                    width: 115.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00292B33),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Unfollow',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(width: 10.0)),
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
