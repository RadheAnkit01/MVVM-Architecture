class AppUrl {
  static var baseUrl = "https://reqres.in/";
  static var loginEndPoint = "${baseUrl}api/login";
  static var registerEndPoint = "${baseUrl}api/register";

  static var apiKey = "reqres_549e4f066b784321a73b08e611ccb10b";

  static Map<String, String> headers = {
    "x-api-key": apiKey,
    "Content-Type": "application/json",
  };
}
