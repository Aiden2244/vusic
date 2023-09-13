import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recipient_ref" field.
  DocumentReference? _recipientRef;
  DocumentReference? get recipientRef => _recipientRef;
  bool hasRecipientRef() => _recipientRef != null;

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "nofitication_type" field.
  String? _nofiticationType;
  String get nofiticationType => _nofiticationType ?? '';
  bool hasNofiticationType() => _nofiticationType != null;

  // "notification_created_time" field.
  DateTime? _notificationCreatedTime;
  DateTime? get notificationCreatedTime => _notificationCreatedTime;
  bool hasNotificationCreatedTime() => _notificationCreatedTime != null;

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _recipientRef = snapshotData['recipient_ref'] as DocumentReference?;
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _nofiticationType = snapshotData['nofitication_type'] as String?;
    _notificationCreatedTime =
        snapshotData['notification_created_time'] as DateTime?;
    _notificationText = snapshotData['notification_text'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notifications')
          : FirebaseFirestore.instance.collectionGroup('notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notifications').doc();

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? recipientRef,
  DocumentReference? senderRef,
  String? nofiticationType,
  DateTime? notificationCreatedTime,
  String? notificationText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipient_ref': recipientRef,
      'sender_ref': senderRef,
      'nofitication_type': nofiticationType,
      'notification_created_time': notificationCreatedTime,
      'notification_text': notificationText,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.recipientRef == e2?.recipientRef &&
        e1?.senderRef == e2?.senderRef &&
        e1?.nofiticationType == e2?.nofiticationType &&
        e1?.notificationCreatedTime == e2?.notificationCreatedTime &&
        e1?.notificationText == e2?.notificationText;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.recipientRef,
        e?.senderRef,
        e?.nofiticationType,
        e?.notificationCreatedTime,
        e?.notificationText
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
