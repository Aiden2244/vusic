import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  bool hasNotificationBody() => _notificationBody != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "comment_ref" field.
  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  bool hasCommentRef() => _commentRef != null;

  // "sender_username" field.
  String? _senderUsername;
  String get senderUsername => _senderUsername ?? '';
  bool hasSenderUsername() => _senderUsername != null;

  // "sender_pfp" field.
  String? _senderPfp;
  String get senderPfp => _senderPfp ?? '';
  bool hasSenderPfp() => _senderPfp != null;

  void _initializeFields() {
    _recipientRef = snapshotData['recipient_ref'] as DocumentReference?;
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _isRead = snapshotData['is_read'] as bool?;
    _notificationBody = snapshotData['notification_body'] as String?;
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _commentRef = snapshotData['comment_ref'] as DocumentReference?;
    _senderUsername = snapshotData['sender_username'] as String?;
    _senderPfp = snapshotData['sender_pfp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

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

  static NotificationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      NotificationsRecord.getDocumentFromData(
        {
          'recipient_ref': convertAlgoliaParam(
            snapshot.data['recipient_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'sender_ref': convertAlgoliaParam(
            snapshot.data['sender_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'type': snapshot.data['type'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'is_read': snapshot.data['is_read'],
          'notification_body': snapshot.data['notification_body'],
          'post_ref': convertAlgoliaParam(
            snapshot.data['post_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'comment_ref': convertAlgoliaParam(
            snapshot.data['comment_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'sender_username': snapshot.data['sender_username'],
          'sender_pfp': snapshot.data['sender_pfp'],
        },
        NotificationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<NotificationsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'notifications',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? type,
  DateTime? createdAt,
  bool? isRead,
  String? notificationBody,
  DocumentReference? postRef,
  DocumentReference? commentRef,
  String? senderUsername,
  String? senderPfp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipient_ref': recipientRef,
      'sender_ref': senderRef,
      'type': type,
      'created_at': createdAt,
      'is_read': isRead,
      'notification_body': notificationBody,
      'post_ref': postRef,
      'comment_ref': commentRef,
      'sender_username': senderUsername,
      'sender_pfp': senderPfp,
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
        e1?.type == e2?.type &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isRead == e2?.isRead &&
        e1?.notificationBody == e2?.notificationBody &&
        e1?.postRef == e2?.postRef &&
        e1?.commentRef == e2?.commentRef &&
        e1?.senderUsername == e2?.senderUsername &&
        e1?.senderPfp == e2?.senderPfp;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.recipientRef,
        e?.senderRef,
        e?.type,
        e?.createdAt,
        e?.isRead,
        e?.notificationBody,
        e?.postRef,
        e?.commentRef,
        e?.senderUsername,
        e?.senderPfp
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
