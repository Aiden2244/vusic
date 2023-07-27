// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends FFFirebaseStruct {
  PostStruct({
    String? postId,
    String? postTitle,
    String? postCaption,
    DocumentReference? postUser,
    DateTime? timePosted,
    int? likesCount,
    List<DocumentReference>? likes,
    int? commentsCount,
    List<CommentStruct>? comments,
    int? sharesCount,
    String? postVideo,
    String? postCoverPhoto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postId = postId,
        _postTitle = postTitle,
        _postCaption = postCaption,
        _postUser = postUser,
        _timePosted = timePosted,
        _likesCount = likesCount,
        _likes = likes,
        _commentsCount = commentsCount,
        _comments = comments,
        _sharesCount = sharesCount,
        _postVideo = postVideo,
        _postCoverPhoto = postCoverPhoto,
        super(firestoreUtilData);

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;
  bool hasPostId() => _postId != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  set postTitle(String? val) => _postTitle = val;
  bool hasPostTitle() => _postTitle != null;

  // "post_caption" field.
  String? _postCaption;
  String get postCaption => _postCaption ?? '';
  set postCaption(String? val) => _postCaption = val;
  bool hasPostCaption() => _postCaption != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  set postUser(DocumentReference? val) => _postUser = val;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  set timePosted(DateTime? val) => _timePosted = val;
  bool hasTimePosted() => _timePosted != null;

  // "likes_count" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  set likesCount(int? val) => _likesCount = val;
  void incrementLikesCount(int amount) => _likesCount = likesCount + amount;
  bool hasLikesCount() => _likesCount != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  set likes(List<DocumentReference>? val) => _likes = val;
  void updateLikes(Function(List<DocumentReference>) updateFn) =>
      updateFn(_likes ??= []);
  bool hasLikes() => _likes != null;

  // "comments_count" field.
  int? _commentsCount;
  int get commentsCount => _commentsCount ?? 0;
  set commentsCount(int? val) => _commentsCount = val;
  void incrementCommentsCount(int amount) =>
      _commentsCount = commentsCount + amount;
  bool hasCommentsCount() => _commentsCount != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  set comments(List<CommentStruct>? val) => _comments = val;
  void updateComments(Function(List<CommentStruct>) updateFn) =>
      updateFn(_comments ??= []);
  bool hasComments() => _comments != null;

  // "shares_count" field.
  int? _sharesCount;
  int get sharesCount => _sharesCount ?? 0;
  set sharesCount(int? val) => _sharesCount = val;
  void incrementSharesCount(int amount) => _sharesCount = sharesCount + amount;
  bool hasSharesCount() => _sharesCount != null;

  // "post_video" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  set postVideo(String? val) => _postVideo = val;
  bool hasPostVideo() => _postVideo != null;

  // "post_cover_photo" field.
  String? _postCoverPhoto;
  String get postCoverPhoto => _postCoverPhoto ?? '';
  set postCoverPhoto(String? val) => _postCoverPhoto = val;
  bool hasPostCoverPhoto() => _postCoverPhoto != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        postId: data['post_id'] as String?,
        postTitle: data['post_title'] as String?,
        postCaption: data['post_caption'] as String?,
        postUser: data['post_user'] as DocumentReference?,
        timePosted: data['time_posted'] as DateTime?,
        likesCount: castToType<int>(data['likes_count']),
        likes: getDataList(data['likes']),
        commentsCount: castToType<int>(data['comments_count']),
        comments: getStructList(
          data['comments'],
          CommentStruct.fromMap,
        ),
        sharesCount: castToType<int>(data['shares_count']),
        postVideo: data['post_video'] as String?,
        postCoverPhoto: data['post_cover_photo'] as String?,
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PostStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'post_id': _postId,
        'post_title': _postTitle,
        'post_caption': _postCaption,
        'post_user': _postUser,
        'time_posted': _timePosted,
        'likes_count': _likesCount,
        'likes': _likes,
        'comments_count': _commentsCount,
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'shares_count': _sharesCount,
        'post_video': _postVideo,
        'post_cover_photo': _postCoverPhoto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'post_title': serializeParam(
          _postTitle,
          ParamType.String,
        ),
        'post_caption': serializeParam(
          _postCaption,
          ParamType.String,
        ),
        'post_user': serializeParam(
          _postUser,
          ParamType.DocumentReference,
        ),
        'time_posted': serializeParam(
          _timePosted,
          ParamType.DateTime,
        ),
        'likes_count': serializeParam(
          _likesCount,
          ParamType.int,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.DocumentReference,
          true,
        ),
        'comments_count': serializeParam(
          _commentsCount,
          ParamType.int,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.DataStruct,
          true,
        ),
        'shares_count': serializeParam(
          _sharesCount,
          ParamType.int,
        ),
        'post_video': serializeParam(
          _postVideo,
          ParamType.String,
        ),
        'post_cover_photo': serializeParam(
          _postCoverPhoto,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        postTitle: deserializeParam(
          data['post_title'],
          ParamType.String,
          false,
        ),
        postCaption: deserializeParam(
          data['post_caption'],
          ParamType.String,
          false,
        ),
        postUser: deserializeParam(
          data['post_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        timePosted: deserializeParam(
          data['time_posted'],
          ParamType.DateTime,
          false,
        ),
        likesCount: deserializeParam(
          data['likes_count'],
          ParamType.int,
          false,
        ),
        likes: deserializeParam<DocumentReference>(
          data['likes'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        commentsCount: deserializeParam(
          data['comments_count'],
          ParamType.int,
          false,
        ),
        comments: deserializeStructParam<CommentStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentStruct.fromSerializableMap,
        ),
        sharesCount: deserializeParam(
          data['shares_count'],
          ParamType.int,
          false,
        ),
        postVideo: deserializeParam(
          data['post_video'],
          ParamType.String,
          false,
        ),
        postCoverPhoto: deserializeParam(
          data['post_cover_photo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostStruct &&
        postId == other.postId &&
        postTitle == other.postTitle &&
        postCaption == other.postCaption &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        likesCount == other.likesCount &&
        listEquality.equals(likes, other.likes) &&
        commentsCount == other.commentsCount &&
        listEquality.equals(comments, other.comments) &&
        sharesCount == other.sharesCount &&
        postVideo == other.postVideo &&
        postCoverPhoto == other.postCoverPhoto;
  }

  @override
  int get hashCode => const ListEquality().hash([
        postId,
        postTitle,
        postCaption,
        postUser,
        timePosted,
        likesCount,
        likes,
        commentsCount,
        comments,
        sharesCount,
        postVideo,
        postCoverPhoto
      ]);
}

PostStruct createPostStruct({
  String? postId,
  String? postTitle,
  String? postCaption,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? likesCount,
  int? commentsCount,
  int? sharesCount,
  String? postVideo,
  String? postCoverPhoto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      postId: postId,
      postTitle: postTitle,
      postCaption: postCaption,
      postUser: postUser,
      timePosted: timePosted,
      likesCount: likesCount,
      commentsCount: commentsCount,
      sharesCount: sharesCount,
      postVideo: postVideo,
      postCoverPhoto: postCoverPhoto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    post
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && post.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = post.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = mapToFirestore(post.toMap());

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((e) => getPostFirestoreData(e, true)).toList() ?? [];
