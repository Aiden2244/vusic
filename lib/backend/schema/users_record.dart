import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "account_type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  bool hasAccountType() => _accountType != null;

  // "favorite_genres" field.
  List<String>? _favoriteGenres;
  List<String> get favoriteGenres => _favoriteGenres ?? const [];
  bool hasFavoriteGenres() => _favoriteGenres != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "fan_count" field.
  int? _fanCount;
  int get fanCount => _fanCount ?? 0;
  bool hasFanCount() => _fanCount != null;

  // "friends_count" field.
  int? _friendsCount;
  int get friendsCount => _friendsCount ?? 0;
  bool hasFriendsCount() => _friendsCount != null;

  // "following_count" field.
  int? _followingCount;
  int get followingCount => _followingCount ?? 0;
  bool hasFollowingCount() => _followingCount != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "backsplash_pic" field.
  String? _backsplashPic;
  String get backsplashPic => _backsplashPic ?? '';
  bool hasBacksplashPic() => _backsplashPic != null;

  // "backsplash_video" field.
  String? _backsplashVideo;
  String get backsplashVideo => _backsplashVideo ?? '';
  bool hasBacksplashVideo() => _backsplashVideo != null;

  // "last_username_change" field.
  DateTime? _lastUsernameChange;
  DateTime? get lastUsernameChange => _lastUsernameChange;
  bool hasLastUsernameChange() => _lastUsernameChange != null;

  // "artist_description" field.
  String? _artistDescription;
  String get artistDescription => _artistDescription ?? '';
  bool hasArtistDescription() => _artistDescription != null;

  // "hometown" field.
  String? _hometown;
  String get hometown => _hometown ?? '';
  bool hasHometown() => _hometown != null;

  // "current_location" field.
  String? _currentLocation;
  String get currentLocation => _currentLocation ?? '';
  bool hasCurrentLocation() => _currentLocation != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "requested_friends" field.
  List<DocumentReference>? _requestedFriends;
  List<DocumentReference> get requestedFriends => _requestedFriends ?? const [];
  bool hasRequestedFriends() => _requestedFriends != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _accountType = snapshotData['account_type'] as String?;
    _favoriteGenres = getDataList(snapshotData['favorite_genres']);
    _userName = snapshotData['user_name'] as String?;
    _fanCount = castToType<int>(snapshotData['fan_count']);
    _friendsCount = castToType<int>(snapshotData['friends_count']);
    _followingCount = castToType<int>(snapshotData['following_count']);
    _bio = snapshotData['bio'] as String?;
    _backsplashPic = snapshotData['backsplash_pic'] as String?;
    _backsplashVideo = snapshotData['backsplash_video'] as String?;
    _lastUsernameChange = snapshotData['last_username_change'] as DateTime?;
    _artistDescription = snapshotData['artist_description'] as String?;
    _hometown = snapshotData['hometown'] as String?;
    _currentLocation = snapshotData['current_location'] as String?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _requestedFriends = getDataList(snapshotData['requested_friends']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'phone_number': snapshot.data['phone_number'],
          'account_type': snapshot.data['account_type'],
          'favorite_genres': safeGet(
            () => snapshot.data['favorite_genres'].toList(),
          ),
          'user_name': snapshot.data['user_name'],
          'fan_count': snapshot.data['fan_count']?.round(),
          'friends_count': snapshot.data['friends_count']?.round(),
          'following_count': snapshot.data['following_count']?.round(),
          'bio': snapshot.data['bio'],
          'backsplash_pic': snapshot.data['backsplash_pic'],
          'backsplash_video': snapshot.data['backsplash_video'],
          'last_username_change': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['last_username_change']),
          ),
          'artist_description': snapshot.data['artist_description'],
          'hometown': snapshot.data['hometown'],
          'current_location': snapshot.data['current_location'],
          'is_verified': snapshot.data['is_verified'],
          'requested_friends': safeGet(
            () => snapshot.data['requested_friends']
                .map((s) => toRef(s))
                .toList(),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? accountType,
  String? userName,
  int? fanCount,
  int? friendsCount,
  int? followingCount,
  String? bio,
  String? backsplashPic,
  String? backsplashVideo,
  DateTime? lastUsernameChange,
  String? artistDescription,
  String? hometown,
  String? currentLocation,
  bool? isVerified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'account_type': accountType,
      'user_name': userName,
      'fan_count': fanCount,
      'friends_count': friendsCount,
      'following_count': followingCount,
      'bio': bio,
      'backsplash_pic': backsplashPic,
      'backsplash_video': backsplashVideo,
      'last_username_change': lastUsernameChange,
      'artist_description': artistDescription,
      'hometown': hometown,
      'current_location': currentLocation,
      'is_verified': isVerified,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.accountType == e2?.accountType &&
        listEquality.equals(e1?.favoriteGenres, e2?.favoriteGenres) &&
        e1?.userName == e2?.userName &&
        e1?.fanCount == e2?.fanCount &&
        e1?.friendsCount == e2?.friendsCount &&
        e1?.followingCount == e2?.followingCount &&
        e1?.bio == e2?.bio &&
        e1?.backsplashPic == e2?.backsplashPic &&
        e1?.backsplashVideo == e2?.backsplashVideo &&
        e1?.lastUsernameChange == e2?.lastUsernameChange &&
        e1?.artistDescription == e2?.artistDescription &&
        e1?.hometown == e2?.hometown &&
        e1?.currentLocation == e2?.currentLocation &&
        e1?.isVerified == e2?.isVerified &&
        listEquality.equals(e1?.requestedFriends, e2?.requestedFriends);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.accountType,
        e?.favoriteGenres,
        e?.userName,
        e?.fanCount,
        e?.friendsCount,
        e?.followingCount,
        e?.bio,
        e?.backsplashPic,
        e?.backsplashVideo,
        e?.lastUsernameChange,
        e?.artistDescription,
        e?.hometown,
        e?.currentLocation,
        e?.isVerified,
        e?.requestedFriends
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
