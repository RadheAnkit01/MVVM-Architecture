import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> signInApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
        AppUrl.headers,
      );
      return response;
    } catch (e) {
      print("print from loginApi : $e");
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerEndPoint,
        data,
        AppUrl.headers,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
