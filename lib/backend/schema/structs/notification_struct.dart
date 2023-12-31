// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends FFFirebaseStruct {
  NotificationStruct({
    String? notificationType,
    DateTime? notificationTime,
    DocumentReference? notificationUser,
    String? notificationBody,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notificationType = notificationType,
        _notificationTime = notificationTime,
        _notificationUser = notificationUser,
        _notificationBody = notificationBody,
        super(firestoreUtilData);

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  set notificationType(String? val) => _notificationType = val;
  bool hasNotificationType() => _notificationType != null;

  // "notification_time" field.
  DateTime? _notificationTime;
  DateTime? get notificationTime => _notificationTime;
  set notificationTime(DateTime? val) => _notificationTime = val;
  bool hasNotificationTime() => _notificationTime != null;

  // "notification_user" field.
  DocumentReference? _notificationUser;
  DocumentReference? get notificationUser => _notificationUser;
  set notificationUser(DocumentReference? val) => _notificationUser = val;
  bool hasNotificationUser() => _notificationUser != null;

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  set notificationBody(String? val) => _notificationBody = val;
  bool hasNotificationBody() => _notificationBody != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        notificationType: data['notification_type'] as String?,
        notificationTime: data['notification_time'] as DateTime?,
        notificationUser: data['notification_user'] as DocumentReference?,
        notificationBody: data['notification_body'] as String?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NotificationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'notification_type': _notificationType,
        'notification_time': _notificationTime,
        'notification_user': _notificationUser,
        'notification_body': _notificationBody,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notification_type': serializeParam(
          _notificationType,
          ParamType.String,
        ),
        'notification_time': serializeParam(
          _notificationTime,
          ParamType.DateTime,
        ),
        'notification_user': serializeParam(
          _notificationUser,
          ParamType.DocumentReference,
        ),
        'notification_body': serializeParam(
          _notificationBody,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        notificationType: deserializeParam(
          data['notification_type'],
          ParamType.String,
          false,
        ),
        notificationTime: deserializeParam(
          data['notification_time'],
          ParamType.DateTime,
          false,
        ),
        notificationUser: deserializeParam(
          data['notification_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        notificationBody: deserializeParam(
          data['notification_body'],
          ParamType.String,
          false,
        ),
      );

  static NotificationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NotificationStruct(
        notificationType: convertAlgoliaParam(
          data['notification_type'],
          ParamType.String,
          false,
        ),
        notificationTime: convertAlgoliaParam(
          data['notification_time'],
          ParamType.DateTime,
          false,
        ),
        notificationUser: convertAlgoliaParam(
          data['notification_user'],
          ParamType.DocumentReference,
          false,
        ),
        notificationBody: convertAlgoliaParam(
          data['notification_body'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        notificationType == other.notificationType &&
        notificationTime == other.notificationTime &&
        notificationUser == other.notificationUser &&
        notificationBody == other.notificationBody;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [notificationType, notificationTime, notificationUser, notificationBody]);
}

NotificationStruct createNotificationStruct({
  String? notificationType,
  DateTime? notificationTime,
  DocumentReference? notificationUser,
  String? notificationBody,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationStruct(
      notificationType: notificationType,
      notificationTime: notificationTime,
      notificationUser: notificationUser,
      notificationBody: notificationBody,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationStruct? updateNotificationStruct(
  NotificationStruct? notification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationStructData(
  Map<String, dynamic> firestoreData,
  NotificationStruct? notification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notification == null) {
    return;
  }
  if (notification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationData =
      getNotificationFirestoreData(notification, forFieldValue);
  final nestedData =
      notificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationFirestoreData(
  NotificationStruct? notification, [
  bool forFieldValue = false,
]) {
  if (notification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notification.toMap());

  // Add any Firestore field values
  notification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationListFirestoreData(
  List<NotificationStruct>? notifications,
) =>
    notifications?.map((e) => getNotificationFirestoreData(e, true)).toList() ??
    [];
