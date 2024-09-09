abstract class Env {
  static const String baseUrl = String.fromEnvironment('baseUrl');

  static const String encryptionPassword =
      String.fromEnvironment('encryptionPassword');
}
