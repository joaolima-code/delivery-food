import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core.config.dart';

class CoreGenerateSecureKey {
  CoreGenerateSecureKey();

  final FlutterSecureStorage flutterSecureStorage =
      CoreConfig.injector<FlutterSecureStorage>();

  Future<String?> read(String key) {
    return flutterSecureStorage.read(key: key);
  }

  Future<void> write(String key, List<int> bytes) {
    return flutterSecureStorage.write(
      key: key,
      value: base64UrlEncode(bytes),
    );
  }
}
