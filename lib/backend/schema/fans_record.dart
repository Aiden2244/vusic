import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FansRecord extends FirestoreRecord {
  FansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fan_ref" field.
  DocumentReference? _fanRef;
  DocumentReference? get fanRef => _fanRef;
  bool hasFanRef() => _fanRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fanRef = snapshotData['fan_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fans')
          : FirebaseFirestore.instance.collectionGroup('fans');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fans').doc();

  static Stream<FansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FansRecord.fromSnapshot(s));

  static Future<FansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FansRecord.fromSnapshot(s));

  static FansRecord fromSnapshot(DocumentSnapshot snapshot) => FansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFansRecordData({
  DocumentReference? fanRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fan_ref': fanRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class FansRecordDocumentEquality implements Equality<FansRecord> {
  const FansRecordDocumentEquality();

  @override
  bool equals(FansRecord? e1, FansRecord? e2) {
    return e1?.fanRef == e2?.fanRef;
  }

  @override
  int hash(FansRecord? e) => const ListEquality().hash([e?.fanRef]);

  @override
  bool isValidKey(Object? o) => o is FansRecord;
}
