import 'package:hive_flutter/hive_flutter.dart';

import '../../../core.config.dart';
import '../encryption/core.hive.secure.key.dart';
import '../model/session.model.hive.dart';

class CoreSessionLocalDatasource {
  CoreSessionLocalDatasource();

  final String databasePathUserPreferences = 'app-delivery.SESSION_DATABASE.db';

  static late Box<SessionModel>? _session;

  Future<void> initialize() async {
    registerAdapters();
    await openBoxUserPreference();
  }

  void registerAdapters() {
    Hive.registerAdapter(SessionModelAdapter());
  }

  Future<void> openBoxUserPreference() async {
    _session = await Hive.openBox<SessionModel>(databasePathUserPreferences,
        encryptionCipher: HiveAesCipher(
            await CoreConfig.injector<CoreHiveCreateSecureKey>()
                .getEncryptedKey()));
  }

  SessionModel? getSessionModel() {
    return _session?.get(databasePathUserPreferences,
        defaultValue: SessionModel());
  }

  Future<void> insertToken(String value) async {
    final SessionModel? sessionModel = getSessionModel();
    sessionModel?.token = value;
    await sessionModel?.save();
  }

  String? getToken() {
    final SessionModel? userPreferences = getSessionModel();
    return userPreferences?.token;
  }

  Future<void> insertUsername(String value) async {
    final SessionModel? sessionModel = getSessionModel();
    sessionModel?.username = value;
    await sessionModel?.save();
  }

  String? getUsername() {
    final SessionModel? userPreferences = getSessionModel();
    return userPreferences?.username;
  }

  Future<void> clearData() async {
    await _session!.clear();
  }
}
