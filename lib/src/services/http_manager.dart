import 'package:dio/dio.dart';

abstract class HttpMethods {
  static String post = 'POST';
  static String get = 'GET';
  static String put = 'PUT';
  static String pacth = 'PACTH';
  static String delete = 'DELETE';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    //Headres da requisição
    final defaulHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        'X-Parse-REST-API-Key': '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
      });
    Dio dio = Dio();
    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaulHeaders,
        ),
        data: body,
      );
      //Retorno do resultado do Backend
      return response.data;
    } on DioError catch (error) {
      //Retorno do erro do dio request
      return error.response?.data ?? {};
    } catch (error) {
      //Retorno de map vazio para erro generalizado
      return {};
    }
  }
}
