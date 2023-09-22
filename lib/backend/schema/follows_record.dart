import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowsRecord extends FirestoreRecord {
  FollowsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "followerID" field.
  DocumentReference? _followerID;
  DocumentReference? get followerID => _followerID;
  bool hasFollowerID() => _followerID != null;

  // "followingID" field.
  DocumentReference? _followingID;
  DocumentReference? get followingID => _followingID;
  bool hasFollowingID() => _followingID != null;

  void _initializeFields() {
    _followerID = snapshotData['followerID'] as DocumentReference?;
    _followingID = snapshotData['followingID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('follows');

  static Stream<FollowsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowsRecord.fromSnapshot(s));

  static Future<FollowsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowsRecord.fromSnapshot(s));

  static FollowsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowsRecordData({
  DocumentReference? followerID,
  DocumentReference? followingID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'followerID': followerID,
      'followingID': followingID,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowsRecordDocumentEquality implements Equality<FollowsRecord> {
  const FollowsRecordDocumentEquality();

  @override
  bool equals(FollowsRecord? e1, FollowsRecord? e2) {
    return e1?.followerID == e2?.followerID &&
        e1?.followingID == e2?.followingID;
  }

  @override
  int hash(FollowsRecord? e) =>
      const ListEquality().hash([e?.followerID, e?.followingID]);

  @override
  bool isValidKey(Object? o) => o is FollowsRecord;
}
