import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestedRecord extends FirestoreRecord {
  RequestedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "requested_user_ref" field.
  DocumentReference? _requestedUserRef;
  DocumentReference? get requestedUserRef => _requestedUserRef;
  bool hasRequestedUserRef() => _requestedUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _requestedUserRef =
        snapshotData['requested_user_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requested')
          : FirebaseFirestore.instance.collectionGroup('requested');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('requested').doc();

  static Stream<RequestedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestedRecord.fromSnapshot(s));

  static Future<RequestedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestedRecord.fromSnapshot(s));

  static RequestedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestedRecordData({
  DocumentReference? requestedUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requested_user_ref': requestedUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestedRecordDocumentEquality implements Equality<RequestedRecord> {
  const RequestedRecordDocumentEquality();

  @override
  bool equals(RequestedRecord? e1, RequestedRecord? e2) {
    return e1?.requestedUserRef == e2?.requestedUserRef;
  }

  @override
  int hash(RequestedRecord? e) =>
      const ListEquality().hash([e?.requestedUserRef]);

  @override
  bool isValidKey(Object? o) => o is RequestedRecord;
}
