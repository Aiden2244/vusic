import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpCenterRecord extends FirestoreRecord {
  HelpCenterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "article_ID" field.
  int? _articleID;
  int get articleID => _articleID ?? 0;
  bool hasArticleID() => _articleID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "relate_articles" field.
  List<int>? _relateArticles;
  List<int> get relateArticles => _relateArticles ?? const [];
  bool hasRelateArticles() => _relateArticles != null;

  void _initializeFields() {
    _articleID = castToType<int>(snapshotData['article_ID']);
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _category = snapshotData['category'] as String?;
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _relateArticles = getDataList(snapshotData['relate_articles']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('help_center');

  static Stream<HelpCenterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpCenterRecord.fromSnapshot(s));

  static Future<HelpCenterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpCenterRecord.fromSnapshot(s));

  static HelpCenterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HelpCenterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpCenterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpCenterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpCenterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpCenterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelpCenterRecordData({
  int? articleID,
  String? title,
  String? content,
  String? category,
  DateTime? creationDate,
  DateTime? lastUpdated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'article_ID': articleID,
      'title': title,
      'content': content,
      'category': category,
      'creation_date': creationDate,
      'last_updated': lastUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpCenterRecordDocumentEquality implements Equality<HelpCenterRecord> {
  const HelpCenterRecordDocumentEquality();

  @override
  bool equals(HelpCenterRecord? e1, HelpCenterRecord? e2) {
    const listEquality = ListEquality();
    return e1?.articleID == e2?.articleID &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.category == e2?.category &&
        e1?.creationDate == e2?.creationDate &&
        e1?.lastUpdated == e2?.lastUpdated &&
        listEquality.equals(e1?.relateArticles, e2?.relateArticles);
  }

  @override
  int hash(HelpCenterRecord? e) => const ListEquality().hash([
        e?.articleID,
        e?.title,
        e?.content,
        e?.category,
        e?.creationDate,
        e?.lastUpdated,
        e?.relateArticles
      ]);

  @override
  bool isValidKey(Object? o) => o is HelpCenterRecord;
}
