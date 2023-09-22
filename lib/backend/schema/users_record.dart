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

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "backsplash_pic" field.
  String? _backsplashPic;
  String get backsplashPic => _backsplashPic ?? '';
  bool hasBacksplashPic() => _backsplashPic != null;

  // "last_username_change" field.
  DateTime? _lastUsernameChange;
  DateTime? get lastUsernameChange => _lastUsernameChange;
  bool hasLastUsernameChange() => _lastUsernameChange != null;

  // "artist_description" field.
  String? _artistDescription;
  String get artistDescription => _artistDescription ?? '';
  bool hasArtistDescription() => _artistDescription != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "following_count" field.
  int? _followingCount;
  int get followingCount => _followingCount ?? 0;
  bool hasFollowingCount() => _followingCount != null;

  // "follower_count" field.
  int? _followerCount;
  int get followerCount => _followerCount ?? 0;
  bool hasFollowerCount() => _followerCount != null;

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
    _bio = snapshotData['bio'] as String?;
    _backsplashPic = snapshotData['backsplash_pic'] as String?;
    _lastUsernameChange = snapshotData['last_username_change'] as DateTime?;
    _artistDescription = snapshotData['artist_description'] as String?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _followingCount = castToType<int>(snapshotData['following_count']);
    _followerCount = castToType<int>(snapshotData['follower_count']);
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
          'bio': snapshot.data['bio'],
          'backsplash_pic': snapshot.data['backsplash_pic'],
          'last_username_change': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['last_username_change']),
          ),
          'artist_description': snapshot.data['artist_description'],
          'is_verified': snapshot.data['is_verified'],
          'following_count': snapshot.data['following_count']?.round(),
          'follower_count': snapshot.data['follower_count']?.round(),
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
  String? bio,
  String? backsplashPic,
  DateTime? lastUsernameChange,
  String? artistDescription,
  bool? isVerified,
  int? followingCount,
  int? followerCount,
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
      'bio': bio,
      'backsplash_pic': backsplashPic,
      'last_username_change': lastUsernameChange,
      'artist_description': artistDescription,
      'is_verified': isVerified,
      'following_count': followingCount,
      'follower_count': followerCount,
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
        e1?.bio == e2?.bio &&
        e1?.backsplashPic == e2?.backsplashPic &&
        e1?.lastUsernameChange == e2?.lastUsernameChange &&
        e1?.artistDescription == e2?.artistDescription &&
        e1?.isVerified == e2?.isVerified &&
        e1?.followingCount == e2?.followingCount &&
        e1?.followerCount == e2?.followerCount;
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
        e?.bio,
        e?.backsplashPic,
        e?.lastUsernameChange,
        e?.artistDescription,
        e?.isVerified,
        e?.followingCount,
        e?.followerCount
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
