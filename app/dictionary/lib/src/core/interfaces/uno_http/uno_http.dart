import 'package:uno/uno.dart';

import 'abstract/my_methods.dart';

class UnoHttp extends MyMethods {
  final uno = Uno();

  @override
  Future<Response> get(
    String url,
    Map<String, String> headers,
    Map<String, String> params,
  ) async {
    try {
      final response = await uno.get(
        url,
        headers: headers,
        params: params,
        timeout: const Duration(seconds: 5),
        responseType: ResponseType.json,
      );

      switch (response.status) {
        case 200:
          return response;

        case 404:
          throw Exception("404, $response");

        default:
          throw Exception('Failed to load data, the return is $response');
      }
    } catch (e) {
      rethrow;
    }
  }
}
