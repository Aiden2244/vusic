import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "dashboard_pic" field.
  String? _dashboardPic;
  String get dashboardPic => _dashboardPic ?? '';
  bool hasDashboardPic() => _dashboardPic != null;

  // "dashboard_video" field.
  String? _dashboardVideo;
  String get dashboardVideo => _dashboardVideo ?? '';
  bool hasDashboardVideo() => _dashboardVideo != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "num_followers" field.
  int? _numFollowers;
  int get numFollowers => _numFollowers ?? 0;
  bool hasNumFollowers() => _numFollowers != null;

  // "num_following" field.
  int? _numFollowing;
  int get numFollowing => _numFollowing ?? 0;
  bool hasNumFollowing() => _numFollowing != null;

  // "num_friends" field.
  int? _numFriends;
  int get numFriends => _numFriends ?? 0;
  bool hasNumFriends() => _numFriends != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
    _dashboardPic = snapshotData['dashboard_pic'] as String?;
    _dashboardVideo = snapshotData['dashboard_video'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _numFollowers = castToType<int>(snapshotData['num_followers']);
    _numFollowing = castToType<int>(snapshotData['num_following']);
    _numFriends = castToType<int>(snapshotData['num_friends']);
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _friends = getDataList(snapshotData['friends']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profile')
          : FirebaseFirestore.instance.collectionGroup('profile');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('profile').doc();

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  DateTime? editedTime,
  String? bio,
  String? profilePic,
  String? dashboardPic,
  String? dashboardVideo,
  String? userName,
  int? numFollowers,
  int? numFollowing,
  int? numFriends,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'edited_time': editedTime,
      'bio': bio,
      'profile_pic': profilePic,
      'dashboard_pic': dashboardPic,
      'dashboard_video': dashboardVideo,
      'user_name': userName,
      'num_followers': numFollowers,
      'num_following': numFollowing,
      'num_friends': numFriends,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.profilePic == e2?.profilePic &&
        e1?.dashboardPic == e2?.dashboardPic &&
        e1?.dashboardVideo == e2?.dashboardVideo &&
        e1?.userName == e2?.userName &&
        e1?.numFollowers == e2?.numFollowers &&
        e1?.numFollowing == e2?.numFollowing &&
        e1?.numFriends == e2?.numFriends &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.friends, e2?.friends);
  }

  @override
  int hash(ProfileRecord? e) => const ListEquality().hash([
        e?.editedTime,
        e?.bio,
        e?.profilePic,
        e?.dashboardPic,
        e?.dashboardVideo,
        e?.userName,
        e?.numFollowers,
        e?.numFollowing,
        e?.numFriends,
        e?.followers,
        e?.following,
        e?.friends
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
