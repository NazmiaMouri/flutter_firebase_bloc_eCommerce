class AppUrl {
  static const bool PRODUCTION = false;

  static const String PROD_URL = "";
  static const String DEV_URL = "http://192.168.0.114/api/dev/";

  static const String BASE_URL = PRODUCTION ? PROD_URL : DEV_URL;
}
