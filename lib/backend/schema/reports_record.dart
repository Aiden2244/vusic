import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "report_ID" field.
  int? _reportID;
  int get reportID => _reportID ?? 0;
  bool hasReportID() => _reportID != null;

  // "reporter_ID" field.
  int? _reporterID;
  int get reporterID => _reporterID ?? 0;
  bool hasReporterID() => _reporterID != null;

  // "reported_user_ID" field.
  int? _reportedUserID;
  int get reportedUserID => _reportedUserID ?? 0;
  bool hasReportedUserID() => _reportedUserID != null;

  // "content_ID" field.
  int? _contentID;
  int get contentID => _contentID ?? 0;
  bool hasContentID() => _contentID != null;

  // "content_type" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  bool hasContentType() => _contentType != null;

  // "report_reason" field.
  String? _reportReason;
  String get reportReason => _reportReason ?? '';
  bool hasReportReason() => _reportReason != null;

  // "report_date" field.
  DateTime? _reportDate;
  DateTime? get reportDate => _reportDate;
  bool hasReportDate() => _reportDate != null;

  void _initializeFields() {
    _reportID = castToType<int>(snapshotData['report_ID']);
    _reporterID = castToType<int>(snapshotData['reporter_ID']);
    _reportedUserID = castToType<int>(snapshotData['reported_user_ID']);
    _contentID = castToType<int>(snapshotData['content_ID']);
    _contentType = snapshotData['content_type'] as String?;
    _reportReason = snapshotData['report_reason'] as String?;
    _reportDate = snapshotData['report_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  int? reportID,
  int? reporterID,
  int? reportedUserID,
  int? contentID,
  String? contentType,
  String? reportReason,
  DateTime? reportDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_ID': reportID,
      'reporter_ID': reporterID,
      'reported_user_ID': reportedUserID,
      'content_ID': contentID,
      'content_type': contentType,
      'report_reason': reportReason,
      'report_date': reportDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportID == e2?.reportID &&
        e1?.reporterID == e2?.reporterID &&
        e1?.reportedUserID == e2?.reportedUserID &&
        e1?.contentID == e2?.contentID &&
        e1?.contentType == e2?.contentType &&
        e1?.reportReason == e2?.reportReason &&
        e1?.reportDate == e2?.reportDate;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.reportID,
        e?.reporterID,
        e?.reportedUserID,
        e?.contentID,
        e?.contentType,
        e?.reportReason,
        e?.reportDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
