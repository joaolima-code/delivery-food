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
        return 'https://localhost:3000';
      case EnvironmentEnum.production:
        return 'https://localhost:3000';
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
