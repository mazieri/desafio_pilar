import 'my_interceptors.dart';

abstract class MyMethods {
  final interceptor = <MyInterceptors>[];

  Future<dynamic> get(
    String url,
    Map<String, String> headers,
    Map<String, String> params,
  );
}
