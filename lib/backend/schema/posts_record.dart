import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postedBy_ref" field.
  DocumentReference? _postedByRef;
  DocumentReference? get postedByRef => _postedByRef;
  bool hasPostedByRef() => _postedByRef != null;

  // "post_video" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  bool hasPostVideo() => _postVideo != null;

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_audio" field.
  String? _postAudio;
  String get postAudio => _postAudio ?? '';
  bool hasPostAudio() => _postAudio != null;

  // "post_bodyText" field.
  String? _postBodyText;
  String get postBodyText => _postBodyText ?? '';
  bool hasPostBodyText() => _postBodyText != null;

  // "post_caption" field.
  String? _postCaption;
  String get postCaption => _postCaption ?? '';
  bool hasPostCaption() => _postCaption != null;

  // "parent_post" field.
  DocumentReference? _parentPost;
  DocumentReference? get parentPost => _parentPost;
  bool hasParentPost() => _parentPost != null;

  void _initializeFields() {
    _postedByRef = snapshotData['postedBy_ref'] as DocumentReference?;
    _postVideo = snapshotData['post_video'] as String?;
    _postPhoto = snapshotData['post_photo'] as String?;
    _postAudio = snapshotData['post_audio'] as String?;
    _postBodyText = snapshotData['post_bodyText'] as String?;
    _postCaption = snapshotData['post_caption'] as String?;
    _parentPost = snapshotData['parent_post'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PostsRecord.getDocumentFromData(
        {
          'postedBy_ref': safeGet(
            () => toRef(snapshot.data['postedBy_ref']),
          ),
          'post_video': snapshot.data['post_video'],
          'post_photo': snapshot.data['post_photo'],
          'post_audio': snapshot.data['post_audio'],
          'post_bodyText': snapshot.data['post_bodyText'],
          'post_caption': snapshot.data['post_caption'],
          'parent_post': safeGet(
            () => toRef(snapshot.data['parent_post']),
          ),
        },
        PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference? postedByRef,
  String? postVideo,
  String? postPhoto,
  String? postAudio,
  String? postBodyText,
  String? postCaption,
  DocumentReference? parentPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postedBy_ref': postedByRef,
      'post_video': postVideo,
      'post_photo': postPhoto,
      'post_audio': postAudio,
      'post_bodyText': postBodyText,
      'post_caption': postCaption,
      'parent_post': parentPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.postedByRef == e2?.postedByRef &&
        e1?.postVideo == e2?.postVideo &&
        e1?.postPhoto == e2?.postPhoto &&
        e1?.postAudio == e2?.postAudio &&
        e1?.postBodyText == e2?.postBodyText &&
        e1?.postCaption == e2?.postCaption &&
        e1?.parentPost == e2?.parentPost;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postedByRef,
        e?.postVideo,
        e?.postPhoto,
        e?.postAudio,
        e?.postBodyText,
        e?.postCaption,
        e?.parentPost
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
