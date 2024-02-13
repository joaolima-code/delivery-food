import 'package:hive/hive.dart';

part 'session.model.hive.g.dart';

@HiveType(typeId: 1)
class SessionModel extends HiveObject {
  SessionModel({this.username, this.token});

  @HiveField(0)
  String? username;

  @HiveField(1)
  String? token;

  @override
  String toString() {
    return 'SessionData{\nusername: $username, \n'
        'token: $token \n}';
  }
}
