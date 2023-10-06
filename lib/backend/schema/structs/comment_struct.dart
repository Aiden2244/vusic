// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    String? commentText,
    DocumentReference? commentUser,
    DateTime? commentTime,
    String? commentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _commentText = commentText,
        _commentUser = commentUser,
        _commentTime = commentTime,
        _commentId = commentId,
        super(firestoreUtilData);

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  set commentText(String? val) => _commentText = val;
  bool hasCommentText() => _commentText != null;

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  set commentUser(DocumentReference? val) => _commentUser = val;
  bool hasCommentUser() => _commentUser != null;

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  set commentTime(DateTime? val) => _commentTime = val;
  bool hasCommentTime() => _commentTime != null;

  // "comment_id" field.
  String? _commentId;
  String get commentId => _commentId ?? '';
  set commentId(String? val) => _commentId = val;
  bool hasCommentId() => _commentId != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        commentText: data['comment_text'] as String?,
        commentUser: data['comment_user'] as DocumentReference?,
        commentTime: data['comment_time'] as DateTime?,
        commentId: data['comment_id'] as String?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CommentStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'comment_text': _commentText,
        'comment_user': _commentUser,
        'comment_time': _commentTime,
        'comment_id': _commentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'comment_text': serializeParam(
          _commentText,
          ParamType.String,
        ),
        'comment_user': serializeParam(
          _commentUser,
          ParamType.DocumentReference,
        ),
        'comment_time': serializeParam(
          _commentTime,
          ParamType.DateTime,
        ),
        'comment_id': serializeParam(
          _commentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        commentText: deserializeParam(
          data['comment_text'],
          ParamType.String,
          false,
        ),
        commentUser: deserializeParam(
          data['comment_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        commentTime: deserializeParam(
          data['comment_time'],
          ParamType.DateTime,
          false,
        ),
        commentId: deserializeParam(
          data['comment_id'],
          ParamType.String,
          false,
        ),
      );

  static CommentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CommentStruct(
        commentText: convertAlgoliaParam(
          data['comment_text'],
          ParamType.String,
          false,
        ),
        commentUser: convertAlgoliaParam(
          data['comment_user'],
          ParamType.DocumentReference,
          false,
        ),
        commentTime: convertAlgoliaParam(
          data['comment_time'],
          ParamType.DateTime,
          false,
        ),
        commentId: convertAlgoliaParam(
          data['comment_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        commentText == other.commentText &&
        commentUser == other.commentUser &&
        commentTime == other.commentTime &&
        commentId == other.commentId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([commentText, commentUser, commentTime, commentId]);
}

CommentStruct createCommentStruct({
  String? commentText,
  DocumentReference? commentUser,
  DateTime? commentTime,
  String? commentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      commentText: commentText,
      commentUser: commentUser,
      commentTime: commentTime,
      commentId: commentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? comment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? comment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comment == null) {
    return;
  }
  if (comment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentData = getCommentFirestoreData(comment, forFieldValue);
  final nestedData = commentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? comment, [
  bool forFieldValue = false,
]) {
  if (comment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comment.toMap());

  // Add any Firestore field values
  comment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? comments,
) =>
    comments?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
