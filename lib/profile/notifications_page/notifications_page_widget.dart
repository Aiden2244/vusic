import '/auth/firebase_auth/auth_util.dart';
import '/components/notification_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NOTIFICATIONS_NotificationsPage_ON_INIT_');
      logFirebaseEvent('NotificationsPage_action_block');
      await action_blocks.updateCurrentPage(context);
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
              final notificationsList =
                  (currentUserDocument?.notifications?.toList() ?? []).toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: notificationsList.length,
                itemBuilder: (context, notificationsListIndex) {
                  final notificationsListItem =
                      notificationsList[notificationsListIndex];
                  return wrapWithModel(
                    model: _model.notificationTileModels.getModel(
                      random_data.randomString(
                        10,
                        20,
                        true,
                        true,
                        true,
                      ),
                      notificationsListIndex,
                    ),
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: NotificationTileWidget(
                      key: Key(
                        'Key6hd_${random_data.randomString(
                          10,
                          20,
                          true,
                          true,
                          true,
                        )}',
                      ),
                      notificationType: notificationsListItem.notificationType,
                      notifiicationBody: notificationsListItem.notificationBody,
                      notificationUser: notificationsListItem.notificationUser!,
                      notificationTime: notificationsListItem.notificationTime!,
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
