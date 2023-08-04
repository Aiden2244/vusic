import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowingRecord extends FirestoreRecord {
  FollowingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "following_ref" field.
  DocumentReference? _followingRef;
  DocumentReference? get followingRef => _followingRef;
  bool hasFollowingRef() => _followingRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _followingRef = snapshotData['following_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('following')
          : FirebaseFirestore.instance.collectionGroup('following');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('following').doc();

  static Stream<FollowingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowingRecord.fromSnapshot(s));

  static Future<FollowingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowingRecord.fromSnapshot(s));

  static FollowingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowingRecordData({
  DocumentReference? followingRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'following_ref': followingRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowingRecordDocumentEquality implements Equality<FollowingRecord> {
  const FollowingRecordDocumentEquality();

  @override
  bool equals(FollowingRecord? e1, FollowingRecord? e2) {
    return e1?.followingRef == e2?.followingRef;
  }

  @override
  int hash(FollowingRecord? e) => const ListEquality().hash([e?.followingRef]);

  @override
  bool isValidKey(Object? o) => o is FollowingRecord;
}
