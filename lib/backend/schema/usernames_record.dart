import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsernamesRecord extends FirestoreRecord {
  UsernamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "username_text" field.
  String? _usernameText;
  String get usernameText => _usernameText ?? '';
  bool hasUsernameText() => _usernameText != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _usernameText = snapshotData['username_text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usernames');

  static Stream<UsernamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsernamesRecord.fromSnapshot(s));

  static Future<UsernamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsernamesRecord.fromSnapshot(s));

  static UsernamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsernamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsernamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsernamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsernamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsernamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsernamesRecordData({
  DocumentReference? userRef,
  String? usernameText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'username_text': usernameText,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsernamesRecordDocumentEquality implements Equality<UsernamesRecord> {
  const UsernamesRecordDocumentEquality();

  @override
  bool equals(UsernamesRecord? e1, UsernamesRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.usernameText == e2?.usernameText;
  }

  @override
  int hash(UsernamesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.usernameText]);

  @override
  bool isValidKey(Object? o) => o is UsernamesRecord;
}
