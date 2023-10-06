import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
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

  // "post_type" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  // "genre_tags" field.
  List<String>? _genreTags;
  List<String> get genreTags => _genreTags ?? const [];
  bool hasGenreTags() => _genreTags != null;

  // "spotify_link" field.
  String? _spotifyLink;
  String get spotifyLink => _spotifyLink ?? '';
  bool hasSpotifyLink() => _spotifyLink != null;

  // "promotion_type" field.
  String? _promotionType;
  String get promotionType => _promotionType ?? '';
  bool hasPromotionType() => _promotionType != null;

  // "technical_ability_showcase" field.
  bool? _technicalAbilityShowcase;
  bool get technicalAbilityShowcase => _technicalAbilityShowcase ?? false;
  bool hasTechnicalAbilityShowcase() => _technicalAbilityShowcase != null;

  // "live_show_promotion" field.
  bool? _liveShowPromotion;
  bool get liveShowPromotion => _liveShowPromotion ?? false;
  bool hasLiveShowPromotion() => _liveShowPromotion != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_upvotes" field.
  int? _numUpvotes;
  int get numUpvotes => _numUpvotes ?? 0;
  bool hasNumUpvotes() => _numUpvotes != null;

  // "num_downvotes" field.
  int? _numDownvotes;
  int get numDownvotes => _numDownvotes ?? 0;
  bool hasNumDownvotes() => _numDownvotes != null;

  // "cover_photo_URL" field.
  String? _coverPhotoURL;
  String get coverPhotoURL => _coverPhotoURL ?? '';
  bool hasCoverPhotoURL() => _coverPhotoURL != null;

  // "post_video_URL" field.
  String? _postVideoURL;
  String get postVideoURL => _postVideoURL ?? '';
  bool hasPostVideoURL() => _postVideoURL != null;

  // "post_photo_URL" field.
  String? _postPhotoURL;
  String get postPhotoURL => _postPhotoURL ?? '';
  bool hasPostPhotoURL() => _postPhotoURL != null;

  // "author_ref" field.
  DocumentReference? _authorRef;
  DocumentReference? get authorRef => _authorRef;
  bool hasAuthorRef() => _authorRef != null;

  // "num_shares" field.
  int? _numShares;
  int get numShares => _numShares ?? 0;
  bool hasNumShares() => _numShares != null;

  // "author_spotify_client_ID" field.
  String? _authorSpotifyClientID;
  String get authorSpotifyClientID => _authorSpotifyClientID ?? '';
  bool hasAuthorSpotifyClientID() => _authorSpotifyClientID != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  bool hasHashtags() => _hashtags != null;

  void _initializeFields() {
    _postType = snapshotData['post_type'] as String?;
    _genreTags = getDataList(snapshotData['genre_tags']);
    _spotifyLink = snapshotData['spotify_link'] as String?;
    _promotionType = snapshotData['promotion_type'] as String?;
    _technicalAbilityShowcase =
        snapshotData['technical_ability_showcase'] as bool?;
    _liveShowPromotion = snapshotData['live_show_promotion'] as bool?;
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numUpvotes = castToType<int>(snapshotData['num_upvotes']);
    _numDownvotes = castToType<int>(snapshotData['num_downvotes']);
    _coverPhotoURL = snapshotData['cover_photo_URL'] as String?;
    _postVideoURL = snapshotData['post_video_URL'] as String?;
    _postPhotoURL = snapshotData['post_photo_URL'] as String?;
    _authorRef = snapshotData['author_ref'] as DocumentReference?;
    _numShares = castToType<int>(snapshotData['num_shares']);
    _authorSpotifyClientID =
        snapshotData['author_spotify_client_ID'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _hashtags = getDataList(snapshotData['hashtags']);
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
          'post_type': snapshot.data['post_type'],
          'genre_tags': safeGet(
            () => snapshot.data['genre_tags'].toList(),
          ),
          'spotify_link': snapshot.data['spotify_link'],
          'promotion_type': snapshot.data['promotion_type'],
          'technical_ability_showcase':
              snapshot.data['technical_ability_showcase'],
          'live_show_promotion': snapshot.data['live_show_promotion'],
          'num_comments': convertAlgoliaParam(
            snapshot.data['num_comments'],
            ParamType.int,
            false,
          ),
          'num_upvotes': convertAlgoliaParam(
            snapshot.data['num_upvotes'],
            ParamType.int,
            false,
          ),
          'num_downvotes': convertAlgoliaParam(
            snapshot.data['num_downvotes'],
            ParamType.int,
            false,
          ),
          'cover_photo_URL': snapshot.data['cover_photo_URL'],
          'post_video_URL': snapshot.data['post_video_URL'],
          'post_photo_URL': snapshot.data['post_photo_URL'],
          'author_ref': convertAlgoliaParam(
            snapshot.data['author_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'num_shares': convertAlgoliaParam(
            snapshot.data['num_shares'],
            ParamType.int,
            false,
          ),
          'author_spotify_client_ID': snapshot.data['author_spotify_client_ID'],
          'time_created': convertAlgoliaParam(
            snapshot.data['time_created'],
            ParamType.DateTime,
            false,
          ),
          'hashtags': safeGet(
            () => snapshot.data['hashtags'].toList(),
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
  String? postType,
  String? spotifyLink,
  String? promotionType,
  bool? technicalAbilityShowcase,
  bool? liveShowPromotion,
  int? numComments,
  int? numUpvotes,
  int? numDownvotes,
  String? coverPhotoURL,
  String? postVideoURL,
  String? postPhotoURL,
  DocumentReference? authorRef,
  int? numShares,
  String? authorSpotifyClientID,
  DateTime? timeCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_type': postType,
      'spotify_link': spotifyLink,
      'promotion_type': promotionType,
      'technical_ability_showcase': technicalAbilityShowcase,
      'live_show_promotion': liveShowPromotion,
      'num_comments': numComments,
      'num_upvotes': numUpvotes,
      'num_downvotes': numDownvotes,
      'cover_photo_URL': coverPhotoURL,
      'post_video_URL': postVideoURL,
      'post_photo_URL': postPhotoURL,
      'author_ref': authorRef,
      'num_shares': numShares,
      'author_spotify_client_ID': authorSpotifyClientID,
      'time_created': timeCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postType == e2?.postType &&
        listEquality.equals(e1?.genreTags, e2?.genreTags) &&
        e1?.spotifyLink == e2?.spotifyLink &&
        e1?.promotionType == e2?.promotionType &&
        e1?.technicalAbilityShowcase == e2?.technicalAbilityShowcase &&
        e1?.liveShowPromotion == e2?.liveShowPromotion &&
        e1?.numComments == e2?.numComments &&
        e1?.numUpvotes == e2?.numUpvotes &&
        e1?.numDownvotes == e2?.numDownvotes &&
        e1?.coverPhotoURL == e2?.coverPhotoURL &&
        e1?.postVideoURL == e2?.postVideoURL &&
        e1?.postPhotoURL == e2?.postPhotoURL &&
        e1?.authorRef == e2?.authorRef &&
        e1?.numShares == e2?.numShares &&
        e1?.authorSpotifyClientID == e2?.authorSpotifyClientID &&
        e1?.timeCreated == e2?.timeCreated &&
        listEquality.equals(e1?.hashtags, e2?.hashtags);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postType,
        e?.genreTags,
        e?.spotifyLink,
        e?.promotionType,
        e?.technicalAbilityShowcase,
        e?.liveShowPromotion,
        e?.numComments,
        e?.numUpvotes,
        e?.numDownvotes,
        e?.coverPhotoURL,
        e?.postVideoURL,
        e?.postPhotoURL,
        e?.authorRef,
        e?.numShares,
        e?.authorSpotifyClientID,
        e?.timeCreated,
        e?.hashtags
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
