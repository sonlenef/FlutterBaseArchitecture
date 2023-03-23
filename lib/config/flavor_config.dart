enum Flavor {
  dev,
  stg,
  prod,
}

extension FlavorExt on Flavor {
  String getName() {
    switch (this) {
      case Flavor.dev:
        return 'Develop';
      case Flavor.stg:
        return 'Staging';
      case Flavor.prod:
        return 'Production';
    }
  }

  String getBaseUrl() {
    switch (this) {
      case Flavor.dev:
        return 'base-flutter.sonlenef.dev/api';
      case Flavor.stg:
        return 'base-flutter.sonlenef.stg/api';
      case Flavor.prod:
        return 'base-flutter.sonlenef.prod/api';
    }
  }
}

class FlavorValues {
  final String baseUrl;

  //Add other flavor specific values, e.g database name

  FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor, flavor.getName(), FlavorValues(baseUrl: flavor.getBaseUrl()));

    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig? get instance => _instance;

  static bool isProduction() => _instance?.flavor == Flavor.prod;

  static bool isDevelopment() => _instance?.flavor == Flavor.dev;

  static bool isStaging() => _instance?.flavor == Flavor.stg;
}
