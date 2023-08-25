import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelationshipsRecord extends FirestoreRecord {
  RelationshipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "relationship_ref" field.
  DocumentReference? _relationshipRef;
  DocumentReference? get relationshipRef => _relationshipRef;
  bool hasRelationshipRef() => _relationshipRef != null;

  // "relationship_type" field.
  String? _relationshipType;
  String get relationshipType => _relationshipType ?? '';
  bool hasRelationshipType() => _relationshipType != null;

  // "relationship_created" field.
  DateTime? _relationshipCreated;
  DateTime? get relationshipCreated => _relationshipCreated;
  bool hasRelationshipCreated() => _relationshipCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _relationshipRef = snapshotData['relationship_ref'] as DocumentReference?;
    _relationshipType = snapshotData['relationship_type'] as String?;
    _relationshipCreated = snapshotData['relationship_created'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('relationships')
          : FirebaseFirestore.instance.collectionGroup('relationships');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('relationships').doc();

  static Stream<RelationshipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelationshipsRecord.fromSnapshot(s));

  static Future<RelationshipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelationshipsRecord.fromSnapshot(s));

  static RelationshipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelationshipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelationshipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelationshipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelationshipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelationshipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelationshipsRecordData({
  DocumentReference? relationshipRef,
  String? relationshipType,
  DateTime? relationshipCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'relationship_ref': relationshipRef,
      'relationship_type': relationshipType,
      'relationship_created': relationshipCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelationshipsRecordDocumentEquality
    implements Equality<RelationshipsRecord> {
  const RelationshipsRecordDocumentEquality();

  @override
  bool equals(RelationshipsRecord? e1, RelationshipsRecord? e2) {
    return e1?.relationshipRef == e2?.relationshipRef &&
        e1?.relationshipType == e2?.relationshipType &&
        e1?.relationshipCreated == e2?.relationshipCreated;
  }

  @override
  int hash(RelationshipsRecord? e) => const ListEquality()
      .hash([e?.relationshipRef, e?.relationshipType, e?.relationshipCreated]);

  @override
  bool isValidKey(Object? o) => o is RelationshipsRecord;
}
