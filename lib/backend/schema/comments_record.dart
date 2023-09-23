import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "upvote_count" field.
  int? _upvoteCount;
  int get upvoteCount => _upvoteCount ?? 0;
  bool hasUpvoteCount() => _upvoteCount != null;

  // "downvote_count" field.
  int? _downvoteCount;
  int get downvoteCount => _downvoteCount ?? 0;
  bool hasDownvoteCount() => _downvoteCount != null;

  // "author_ref" field.
  DocumentReference? _authorRef;
  DocumentReference? get authorRef => _authorRef;
  bool hasAuthorRef() => _authorRef != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "parent_comment_ref" field.
  DocumentReference? _parentCommentRef;
  DocumentReference? get parentCommentRef => _parentCommentRef;
  bool hasParentCommentRef() => _parentCommentRef != null;

  // "is_reply" field.
  bool? _isReply;
  bool get isReply => _isReply ?? false;
  bool hasIsReply() => _isReply != null;

  void _initializeFields() {
    _commentText = snapshotData['comment_text'] as String?;
    _upvoteCount = castToType<int>(snapshotData['upvote_count']);
    _downvoteCount = castToType<int>(snapshotData['downvote_count']);
    _authorRef = snapshotData['author_ref'] as DocumentReference?;
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _parentCommentRef =
        snapshotData['parent_comment_ref'] as DocumentReference?;
    _isReply = snapshotData['is_reply'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentText,
  int? upvoteCount,
  int? downvoteCount,
  DocumentReference? authorRef,
  DocumentReference? postRef,
  DocumentReference? parentCommentRef,
  bool? isReply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_text': commentText,
      'upvote_count': upvoteCount,
      'downvote_count': downvoteCount,
      'author_ref': authorRef,
      'post_ref': postRef,
      'parent_comment_ref': parentCommentRef,
      'is_reply': isReply,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.commentText == e2?.commentText &&
        e1?.upvoteCount == e2?.upvoteCount &&
        e1?.downvoteCount == e2?.downvoteCount &&
        e1?.authorRef == e2?.authorRef &&
        e1?.postRef == e2?.postRef &&
        e1?.parentCommentRef == e2?.parentCommentRef &&
        e1?.isReply == e2?.isReply;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentText,
        e?.upvoteCount,
        e?.downvoteCount,
        e?.authorRef,
        e?.postRef,
        e?.parentCommentRef,
        e?.isReply
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
