class FlavorConfig {
  static late String baseUrl;

  static void init({required bool isProd}) {
    baseUrl = "https://api.github.com";
  }
}