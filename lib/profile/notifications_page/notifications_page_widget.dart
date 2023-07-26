import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_page_model.dart';
export 'notifications_page_model.dart';

class NotificationsPageWidget extends StatefulWidget {
  const NotificationsPageWidget({Key? key}) : super(key: key);

  @override
  _NotificationsPageWidgetState createState() =>
      _NotificationsPageWidgetState();
}

class _NotificationsPageWidgetState extends State<NotificationsPageWidget> {
  late NotificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NotificationsPage'});
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
              logFirebaseEvent('NOTIFICATIONS_arrow_back_rounded_ICN_ON_');
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
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: AuthUserStreamWidget(
          builder: (context) => Builder(
            builder: (context) {
              final activeNotifications =
                  (currentUserDocument?.notifications?.toList() ?? []).toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: activeNotifications.length,
                itemBuilder: (context, activeNotificationsIndex) {
                  final activeNotificationsItem =
                      activeNotifications[activeNotificationsIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          activeNotificationsItem.notificationUser!),
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
                        final contentView2UsersRecord = snapshot.data!;
                        return Material(
                          color: Colors.transparent,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF1B2020),
                              borderRadius: BorderRadius.circular(0.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      contentView2UsersRecord.photoUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '@',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      contentView2UsersRecord.userName,
                                      'VUSIC User',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' sent a friend request',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 55.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1B2020),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NOTIFICATIONS_Container_m6zpvzqj_ON_TAP');
                                                final firestoreBatch =
                                                    FirebaseFirestore.instance
                                                        .batch();
                                                try {
                                                  logFirebaseEvent(
                                                      'Container_backend_call');

                                                  firestoreBatch.update(
                                                      currentUserReference!, {
                                                    'friends_count':
                                                        FieldValue.increment(1),
                                                    'friends':
                                                        FieldValue.arrayUnion([
                                                      contentView2UsersRecord
                                                          .reference
                                                    ]),
                                                  });
                                                  logFirebaseEvent(
                                                      'Container_backend_call');

                                                  firestoreBatch.update(
                                                      contentView2UsersRecord
                                                          .reference,
                                                      {
                                                        'friends_count':
                                                            FieldValue
                                                                .increment(1),
                                                        'friends': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                  logFirebaseEvent(
                                                      'Container_backend_call');

                                                  firestoreBatch.update(
                                                      currentUserReference!, {
                                                    'notifications':
                                                        FieldValue.arrayRemove([
                                                      getNotificationFirestoreData(
                                                        updateNotificationStruct(
                                                          activeNotificationsItem,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  });
                                                  logFirebaseEvent(
                                                      'Container_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Friend Request Accepted',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                } finally {
                                                  await firestoreBatch.commit();
                                                }
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF1B2020),
                                                ),
                                                child: Icon(
                                                  Icons.check_circle_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NOTIFICATIONS_Container_57gu9jq6_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  'notifications':
                                                      FieldValue.arrayRemove([
                                                    getNotificationFirestoreData(
                                                      updateNotificationStruct(
                                                        activeNotificationsItem,
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                });
                                                logFirebaseEvent(
                                                    'Container_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Friend Request Deleted',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF1B2020),
                                                ),
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
