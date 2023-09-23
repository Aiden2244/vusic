import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool _value) {
    _darkTheme = _value;
  }

  DocumentReference? _lastSearchedUser;
  DocumentReference? get lastSearchedUser => _lastSearchedUser;
  set lastSearchedUser(DocumentReference? _value) {
    _lastSearchedUser = _value;
  }

  String _LastPageVisited = 'ProfilePage';
  String get LastPageVisited => _LastPageVisited;
  set LastPageVisited(String _value) {
    _LastPageVisited = _value;
  }

  String _CurrentPage = 'ProfilePage';
  String get CurrentPage => _CurrentPage;
  set CurrentPage(String _value) {
    _CurrentPage = _value;
  }

  final _recentlyAccessedUsersManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> recentlyAccessedUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _recentlyAccessedUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecentlyAccessedUsersCache() =>
      _recentlyAccessedUsersManager.clear();
  void clearRecentlyAccessedUsersCacheKey(String? uniqueKey) =>
      _recentlyAccessedUsersManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
