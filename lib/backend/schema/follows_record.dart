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

  // "followingID" field.
  DocumentReference? _followingID;
  DocumentReference? get followingID => _followingID;
  bool hasFollowingID() => _followingID != null;

  // "followedID" field.
  DocumentReference? _followedID;
  DocumentReference? get followedID => _followedID;
  bool hasFollowedID() => _followedID != null;

  void _initializeFields() {
    _followingID = snapshotData['followingID'] as DocumentReference?;
    _followedID = snapshotData['followedID'] as DocumentReference?;
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
  DocumentReference? followingID,
  DocumentReference? followedID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'followingID': followingID,
      'followedID': followedID,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowsRecordDocumentEquality implements Equality<FollowsRecord> {
  const FollowsRecordDocumentEquality();

  @override
  bool equals(FollowsRecord? e1, FollowsRecord? e2) {
    return e1?.followingID == e2?.followingID &&
        e1?.followedID == e2?.followedID;
  }

  @override
  int hash(FollowsRecord? e) =>
      const ListEquality().hash([e?.followingID, e?.followedID]);

  @override
  bool isValidKey(Object? o) => o is FollowsRecord;
}
