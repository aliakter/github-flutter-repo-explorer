enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;
  final String appName;

  static late FlavorConfig instance;

  FlavorConfig({
    required this.flavor,
    required this.baseUrl,
    required this.appName,
  }) {
    instance = this;
  }

  static bool get isDev => instance.flavor == Flavor.dev;
  static bool get isProd => instance.flavor == Flavor.prod;
}