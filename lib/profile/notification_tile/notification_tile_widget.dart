import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_tile_model.dart';
export 'notification_tile_model.dart';

class NotificationTileWidget extends StatefulWidget {
  const NotificationTileWidget({
    Key? key,
    required this.currentNotification,
  }) : super(key: key);

  final NotificationStruct? currentNotification;

  @override
  _NotificationTileWidgetState createState() => _NotificationTileWidgetState();
}

class _NotificationTileWidgetState extends State<NotificationTileWidget> {
  late NotificationTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationTileModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: FutureBuilder<UsersRecord>(
        future: UsersRecord.getDocumentOnce(
            widget.currentNotification!.notificationUser!),
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
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF1B2020),
                borderRadius: BorderRadius.circular(0.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'NOTIFICATION_TILE_CircleImage_r5fixkoo_O');
                        if (contentView2UsersRecord.accountType == 'fan') {
                          logFirebaseEvent('CircleImage_navigate_to');

                          context.pushNamed(
                            'FanProfilePage',
                            queryParameters: {
                              'pageUser': serializeParam(
                                contentView2UsersRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        } else {
                          logFirebaseEvent('CircleImage_navigate_to');

                          context.pushNamed(
                            'MusicianProfilePage',
                            queryParameters: {
                              'pageUser': serializeParam(
                                contentView2UsersRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        }
                      },
                      child: Container(
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '@',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 12.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      ' ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 12.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.currentNotification?.notificationBody,
                          'sent you a notification',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    if (widget.currentNotification?.notificationType ==
                        'friend_request')
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NOTIFICATION_TILE_Container_2d67lyns_ON_');
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      logFirebaseEvent(
                                          'Container_backend_call');

                                      firestoreBatch
                                          .update(currentUserReference!, {
                                        'friends_count':
                                            FieldValue.increment(1),
                                        'friends': FieldValue.arrayUnion([
                                          contentView2UsersRecord.reference
                                        ]),
                                      });
                                      logFirebaseEvent(
                                          'Container_backend_call');

                                      firestoreBatch.update(
                                          contentView2UsersRecord.reference, {
                                        'friends_count':
                                            FieldValue.increment(1),
                                        'friends': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      });
                                      logFirebaseEvent(
                                          'Container_action_block');
                                      await action_blocks.notifyUser(
                                        context,
                                        userToNotify:
                                            contentView2UsersRecord.reference,
                                        notificationType:
                                            'friend_requect_accept',
                                        notificationBody:
                                            'accepted your friend request',
                                      );
                                      logFirebaseEvent(
                                          'Container_backend_call');

                                      firestoreBatch
                                          .update(currentUserReference!, {
                                        'notifications':
                                            FieldValue.arrayRemove([
                                          getNotificationFirestoreData(
                                            updateNotificationStruct(
                                              widget.currentNotification,
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
                                            'Friend Request Accepted',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NOTIFICATION_TILE_Container_xfdvj708_ON_');
                                    logFirebaseEvent('Container_backend_call');

                                    await currentUserReference!.update({
                                      'notifications': FieldValue.arrayRemove([
                                        getNotificationFirestoreData(
                                          updateNotificationStruct(
                                            widget.currentNotification,
                                            clearUnsetFields: true,
                                          ),
                                          true,
                                        )
                                      ]),
                                    });
                                    logFirebaseEvent(
                                        'Container_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Friend Request Deleted',
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
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1B2020),
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.currentNotification?.notificationType !=
                        'friend_request')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF1B2020),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 20.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.delete,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NOTIFICATION_TILE_COMP_delete_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_backend_call');

                              await currentUserReference!.update({
                                'notifications': FieldValue.arrayRemove([
                                  getNotificationFirestoreData(
                                    updateNotificationStruct(
                                      widget.currentNotification,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              });
                            },
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
  }
}
