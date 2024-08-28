import 'package:dio/dio.dart';

class InitDio {
  static Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://forkify-api.herokuapp.com/api",
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }
}
