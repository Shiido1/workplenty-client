enum Environment { development, staging, qa, production }

class AppConfig {
  static Environment environment = Environment.staging;
  static const String stagingURL = "https://sandbox.workplenty.io/api/";
  static const String productionURL = "";

  static final coreBaseUrl =
      environment == Environment.production ? productionURL : stagingURL;

  static const String FLUTTER_WAVE_PUBLIC_SECRETE_TEST_KEY =
      '26024c95cfa414ec292043dad78170a5-X';

  static const String FLUTTER_WAVE_PUBLIC_ENCRYPTION_TEST_KEY = "";

  static const String FLUTTER_WAVE_PUBLIC_TEST_KEY =
      "FLWPUBK_TEST-cccfe68b4224eb04ae088986cb7b419f-X";

  static const String FLUTTER_WAVE_PUBLIC_LIVE_KEY = "";

  static const String FLUTTER_WAVE_PUBLIC_SECRETE_LIVE_KEY = '';

  static const String FLUTTER_WAVE_PUBLIC_ENCRYPTION_LIVE_KEY = "";

  static final flutterWavePublicKey = environment == Environment.production
      ? FLUTTER_WAVE_PUBLIC_LIVE_KEY
      : FLUTTER_WAVE_PUBLIC_TEST_KEY;

  static final flutterWaveSecreteKey = environment == Environment.production
      ? FLUTTER_WAVE_PUBLIC_SECRETE_LIVE_KEY
      : FLUTTER_WAVE_PUBLIC_SECRETE_TEST_KEY;

  static final flutterWaveEncryptionKey = environment == Environment.production
      ? FLUTTER_WAVE_PUBLIC_ENCRYPTION_LIVE_KEY
      : FLUTTER_WAVE_PUBLIC_ENCRYPTION_TEST_KEY;

  static final flutterWaveMode =
      environment == Environment.production ? false : true;
}
