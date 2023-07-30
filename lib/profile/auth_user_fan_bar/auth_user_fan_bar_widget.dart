import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_user_fan_bar_model.dart';
export 'auth_user_fan_bar_model.dart';

class AuthUserFanBarWidget extends StatefulWidget {
  const AuthUserFanBarWidget({Key? key}) : super(key: key);

  @override
  _AuthUserFanBarWidgetState createState() => _AuthUserFanBarWidgetState();
}

class _AuthUserFanBarWidgetState extends State<AuthUserFanBarWidget> {
  late AuthUserFanBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthUserFanBarModel());
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
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('AUTH_USER_FAN_BAR_Container_ob1mg5zy_ON_');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(
                  'UserListPage',
                  queryParameters: {
                    'titleText': serializeParam(
                      'Friends',
                      ParamType.String,
                    ),
                    'account': serializeParam(
                      currentUserReference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).height * 0.06,
                decoration: BoxDecoration(
                  color: Color(0x00292B33),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        formatNumber(
                          valueOrDefault(currentUserDocument?.friendsCount, 0),
                          formatType: FormatType.compact,
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
                    ),
                    Text(
                      'Friends',
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
                  logFirebaseEvent('AUTH_USER_FAN_BAR_Container_uyjfyizj_ON_');
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    'UserListPage',
                    queryParameters: {
                      'titleText': serializeParam(
                        'Following',
                        ParamType.String,
                      ),
                      'account': serializeParam(
                        currentUserReference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                    color: Color(0x00292B33),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          formatNumber(
                            valueOrDefault(
                                currentUserDocument?.followingCount, 0),
                            formatType: FormatType.compact,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
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
        ],
      ),
    );
  }
}
