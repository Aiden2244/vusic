import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationsRecord extends FirestoreRecord {
  UserNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_ref" field.
  DocumentReference? _notificationRef;
  DocumentReference? get notificationRef => _notificationRef;
  bool hasNotificationRef() => _notificationRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notificationRef = snapshotData['notification_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userNotifications')
          : FirebaseFirestore.instance.collectionGroup('userNotifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('userNotifications').doc();

  static Stream<UserNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationsRecord.fromSnapshot(s));

  static Future<UserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationsRecord.fromSnapshot(s));

  static UserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationsRecordData({
  DocumentReference? notificationRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_ref': notificationRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNotificationsRecordDocumentEquality
    implements Equality<UserNotificationsRecord> {
  const UserNotificationsRecordDocumentEquality();

  @override
  bool equals(UserNotificationsRecord? e1, UserNotificationsRecord? e2) {
    return e1?.notificationRef == e2?.notificationRef;
  }

  @override
  int hash(UserNotificationsRecord? e) =>
      const ListEquality().hash([e?.notificationRef]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationsRecord;
}
