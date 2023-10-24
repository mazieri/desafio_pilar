import 'package:dictionary/src/core/core_exports.dart';

class TesteHttp {
  final UnoHttp client;

  TesteHttp(this.client);

  Future getXcoisa() {
    return client.get(
      'https://www.google.com',
      {},
      {},
    );
  }
}
