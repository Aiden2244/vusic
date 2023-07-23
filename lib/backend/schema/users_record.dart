import 'dart:async';

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

  // "fans" field.
  List<DocumentReference>? _fans;
  List<DocumentReference> get fans => _fans ?? const [];
  bool hasFans() => _fans != null;

  // "friends_count" field.
  int? _friendsCount;
  int get friendsCount => _friendsCount ?? 0;
  bool hasFriendsCount() => _friendsCount != null;

  // "following_count" field.
  int? _followingCount;
  int get followingCount => _followingCount ?? 0;
  bool hasFollowingCount() => _followingCount != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

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

  // "posts" field.
  List<PostStruct>? _posts;
  List<PostStruct> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "friends" field.
  DocumentReference? _friends;
  DocumentReference? get friends => _friends;
  bool hasFriends() => _friends != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "notifications" field.
  List<NotificationStruct>? _notifications;
  List<NotificationStruct> get notifications => _notifications ?? const [];
  bool hasNotifications() => _notifications != null;

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
    _fans = getDataList(snapshotData['fans']);
    _friendsCount = castToType<int>(snapshotData['friends_count']);
    _followingCount = castToType<int>(snapshotData['following_count']);
    _following = getDataList(snapshotData['following']);
    _bio = snapshotData['bio'] as String?;
    _backsplashPic = snapshotData['backsplash_pic'] as String?;
    _backsplashVideo = snapshotData['backsplash_video'] as String?;
    _lastUsernameChange = snapshotData['last_username_change'] as DateTime?;
    _artistDescription = snapshotData['artist_description'] as String?;
    _hometown = snapshotData['hometown'] as String?;
    _currentLocation = snapshotData['current_location'] as String?;
    _posts = getStructList(
      snapshotData['posts'],
      PostStruct.fromMap,
    );
    _friends = snapshotData['friends'] as DocumentReference?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _notifications = getStructList(
      snapshotData['notifications'],
      NotificationStruct.fromMap,
    );
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
  DocumentReference? friends,
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
      'friends': friends,
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
        listEquality.equals(e1?.fans, e2?.fans) &&
        e1?.friendsCount == e2?.friendsCount &&
        e1?.followingCount == e2?.followingCount &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.bio == e2?.bio &&
        e1?.backsplashPic == e2?.backsplashPic &&
        e1?.backsplashVideo == e2?.backsplashVideo &&
        e1?.lastUsernameChange == e2?.lastUsernameChange &&
        e1?.artistDescription == e2?.artistDescription &&
        e1?.hometown == e2?.hometown &&
        e1?.currentLocation == e2?.currentLocation &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        e1?.friends == e2?.friends &&
        e1?.isVerified == e2?.isVerified &&
        listEquality.equals(e1?.notifications, e2?.notifications);
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
        e?.fans,
        e?.friendsCount,
        e?.followingCount,
        e?.following,
        e?.bio,
        e?.backsplashPic,
        e?.backsplashVideo,
        e?.lastUsernameChange,
        e?.artistDescription,
        e?.hometown,
        e?.currentLocation,
        e?.posts,
        e?.friends,
        e?.isVerified,
        e?.notifications
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
