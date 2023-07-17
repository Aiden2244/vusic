// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileStruct extends FFFirebaseStruct {
  UserProfileStruct({
    String? userName,
    String? bio,
    String? profilePic,
    String? backsplashPic,
    String? backsplashVideo,
    DateTime? lastUpdatedTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userName = userName,
        _bio = bio,
        _profilePic = profilePic,
        _backsplashPic = backsplashPic,
        _backsplashVideo = backsplashVideo,
        _lastUpdatedTime = lastUpdatedTime,
        super(firestoreUtilData);

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;
  bool hasBio() => _bio != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;
  bool hasProfilePic() => _profilePic != null;

  // "backsplash_pic" field.
  String? _backsplashPic;
  String get backsplashPic => _backsplashPic ?? '';
  set backsplashPic(String? val) => _backsplashPic = val;
  bool hasBacksplashPic() => _backsplashPic != null;

  // "backsplash_video" field.
  String? _backsplashVideo;
  String get backsplashVideo => _backsplashVideo ?? '';
  set backsplashVideo(String? val) => _backsplashVideo = val;
  bool hasBacksplashVideo() => _backsplashVideo != null;

  // "last_updated_time" field.
  DateTime? _lastUpdatedTime;
  DateTime? get lastUpdatedTime => _lastUpdatedTime;
  set lastUpdatedTime(DateTime? val) => _lastUpdatedTime = val;
  bool hasLastUpdatedTime() => _lastUpdatedTime != null;

  static UserProfileStruct fromMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        userName: data['user_name'] as String?,
        bio: data['bio'] as String?,
        profilePic: data['profile_pic'] as String?,
        backsplashPic: data['backsplash_pic'] as String?,
        backsplashVideo: data['backsplash_video'] as String?,
        lastUpdatedTime: data['last_updated_time'] as DateTime?,
      );

  static UserProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_name': _userName,
        'bio': _bio,
        'profile_pic': _profilePic,
        'backsplash_pic': _backsplashPic,
        'backsplash_video': _backsplashVideo,
        'last_updated_time': _lastUpdatedTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'profile_pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
        'backsplash_pic': serializeParam(
          _backsplashPic,
          ParamType.String,
        ),
        'backsplash_video': serializeParam(
          _backsplashVideo,
          ParamType.String,
        ),
        'last_updated_time': serializeParam(
          _lastUpdatedTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        profilePic: deserializeParam(
          data['profile_pic'],
          ParamType.String,
          false,
        ),
        backsplashPic: deserializeParam(
          data['backsplash_pic'],
          ParamType.String,
          false,
        ),
        backsplashVideo: deserializeParam(
          data['backsplash_video'],
          ParamType.String,
          false,
        ),
        lastUpdatedTime: deserializeParam(
          data['last_updated_time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'UserProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileStruct &&
        userName == other.userName &&
        bio == other.bio &&
        profilePic == other.profilePic &&
        backsplashPic == other.backsplashPic &&
        backsplashVideo == other.backsplashVideo &&
        lastUpdatedTime == other.lastUpdatedTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userName,
        bio,
        profilePic,
        backsplashPic,
        backsplashVideo,
        lastUpdatedTime
      ]);
}

UserProfileStruct createUserProfileStruct({
  String? userName,
  String? bio,
  String? profilePic,
  String? backsplashPic,
  String? backsplashVideo,
  DateTime? lastUpdatedTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileStruct(
      userName: userName,
      bio: bio,
      profilePic: profilePic,
      backsplashPic: backsplashPic,
      backsplashVideo: backsplashVideo,
      lastUpdatedTime: lastUpdatedTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileStruct? updateUserProfileStruct(
  UserProfileStruct? userProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileStructData(
  Map<String, dynamic> firestoreData,
  UserProfileStruct? userProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfile == null) {
    return;
  }
  if (userProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && userProfile.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileData =
      getUserProfileFirestoreData(userProfile, forFieldValue);
  final nestedData =
      userProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = userProfile.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileFirestoreData(
  UserProfileStruct? userProfile, [
  bool forFieldValue = false,
]) {
  if (userProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfile.toMap());

  // Add any Firestore field values
  userProfile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileListFirestoreData(
  List<UserProfileStruct>? userProfiles,
) =>
    userProfiles?.map((e) => getUserProfileFirestoreData(e, true)).toList() ??
    [];