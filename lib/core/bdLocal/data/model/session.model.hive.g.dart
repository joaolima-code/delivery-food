// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.model.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionModelAdapter extends TypeAdapter<SessionModel> {
  @override
  final int typeId = 1;

  @override
  SessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionModel(
      userInfo: fields[0] as UserInfoModel?,
      token: fields[1] as String?,
      refreshToken: fields[2] as String?,
      sessionStatus: fields[3] as SessionStatusEnum?,
      authenticationDate: fields[4] as DateTime?,
      lastSession: fields[5] as DateTime?,
      sessionCount: fields[6] as int?,
      isOnboarding: fields[7] as bool?,
      filterOffers: fields[8] as FilterOffersModel?,
      offersLikesModel: fields[9] as OffersLikesModel?,
      appVersion: fields[10] as String?,
      signInType: fields[11] as SignInType?,
      wishlist: (fields[13] as List?)?.cast<WishlistModelHive>(),
      wishlistSuggestions:
          (fields[14] as List?)?.cast<WishlistSuggestionModelHive>(),
    )..followedUsers = (fields[12] as List?)?.cast<UserInfoModel>();
  }

  @override
  void write(BinaryWriter writer, SessionModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.userInfo)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.sessionStatus)
      ..writeByte(4)
      ..write(obj.authenticationDate)
      ..writeByte(5)
      ..write(obj.lastSession)
      ..writeByte(6)
      ..write(obj.sessionCount)
      ..writeByte(7)
      ..write(obj.isOnboarding)
      ..writeByte(8)
      ..write(obj.filterOffers)
      ..writeByte(9)
      ..write(obj.offersLikesModel)
      ..writeByte(10)
      ..write(obj.appVersion)
      ..writeByte(11)
      ..write(obj.signInType)
      ..writeByte(12)
      ..write(obj.followedUsers)
      ..writeByte(13)
      ..write(obj.wishlist)
      ..writeByte(14)
      ..write(obj.wishlistSuggestions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
