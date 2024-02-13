enum EnvironmentEnum {
  release,
  production,
}

extension EnvironmentEnumExtension on EnvironmentEnum {
  String get appName {
    switch (this) {
      case EnvironmentEnum.release:
        return 'Delivery-food-release';
      case EnvironmentEnum.production:
        return 'Delivery-food';
    }
  }

  String get baseUrl {
    switch (this) {
      case EnvironmentEnum.release:
        return 'http://192.168.1.104:3000';
      case EnvironmentEnum.production:
        return 'http://192.168.1.104:3000';
    }
  }

  static EnvironmentEnum getByName(String name) {
    if (name == 'release') {
      return EnvironmentEnum.release;
    } else if (name == 'production') {
      return EnvironmentEnum.production;
    } else {
      return EnvironmentEnum.release;
    }
  }
}
