import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockedUsersRecord extends FirestoreRecord {
  BlockedUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "block_ID" field.
  int? _blockID;
  int get blockID => _blockID ?? 0;
  bool hasBlockID() => _blockID != null;

  // "blocker_ID" field.
  int? _blockerID;
  int get blockerID => _blockerID ?? 0;
  bool hasBlockerID() => _blockerID != null;

  // "blocked_user_ID" field.
  int? _blockedUserID;
  int get blockedUserID => _blockedUserID ?? 0;
  bool hasBlockedUserID() => _blockedUserID != null;

  // "block_date" field.
  DateTime? _blockDate;
  DateTime? get blockDate => _blockDate;
  bool hasBlockDate() => _blockDate != null;

  void _initializeFields() {
    _blockID = castToType<int>(snapshotData['block_ID']);
    _blockerID = castToType<int>(snapshotData['blocker_ID']);
    _blockedUserID = castToType<int>(snapshotData['blocked_user_ID']);
    _blockDate = snapshotData['block_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blocked_users');

  static Stream<BlockedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlockedUsersRecord.fromSnapshot(s));

  static Future<BlockedUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlockedUsersRecord.fromSnapshot(s));

  static BlockedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlockedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlockedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlockedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlockedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlockedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlockedUsersRecordData({
  int? blockID,
  int? blockerID,
  int? blockedUserID,
  DateTime? blockDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'block_ID': blockID,
      'blocker_ID': blockerID,
      'blocked_user_ID': blockedUserID,
      'block_date': blockDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlockedUsersRecordDocumentEquality
    implements Equality<BlockedUsersRecord> {
  const BlockedUsersRecordDocumentEquality();

  @override
  bool equals(BlockedUsersRecord? e1, BlockedUsersRecord? e2) {
    return e1?.blockID == e2?.blockID &&
        e1?.blockerID == e2?.blockerID &&
        e1?.blockedUserID == e2?.blockedUserID &&
        e1?.blockDate == e2?.blockDate;
  }

  @override
  int hash(BlockedUsersRecord? e) => const ListEquality()
      .hash([e?.blockID, e?.blockerID, e?.blockedUserID, e?.blockDate]);

  @override
  bool isValidKey(Object? o) => o is BlockedUsersRecord;
}
