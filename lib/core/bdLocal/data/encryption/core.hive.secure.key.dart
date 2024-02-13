import 'dart:convert';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../core.config.dart';
import 'core.generate.secure.key.dart';

class CoreHiveCreateSecureKey {
  CoreHiveCreateSecureKey({required this.key});

  final CoreGenerateSecureKey generateSecureKey =
      CoreConfig.injector<CoreGenerateSecureKey>();
  final String key;

  Future<Uint8List> getEncryptedKey() async {
    String? encryptionKey = await _getSecureKey();
    if (encryptionKey == null) {
      await _createKey();
    }
    encryptionKey = await _getSecureKey();
    return base64Url.decode(encryptionKey!);
  }

  Future<void> _createKey() async {
    return generateSecureKey.write(
      key,
      _hiveGenerateSecureKey(),
    );
  }

  Future<String?> _getSecureKey() async {
    return generateSecureKey.read(key);
  }

  List<int> _hiveGenerateSecureKey() {
    return Hive.generateSecureKey();
  }
}
