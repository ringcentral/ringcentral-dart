import 'dart:convert';
import 'package:http/http.dart' as http;

class RingCentral {
  String server;
  String? clientId;
  String? clientSecret;
  dynamic tokenInfo;

  RingCentral({required this.server, this.clientId, this.clientSecret}) {
    if (server.startsWith('https://')) {
      server = server.substring(8);
    }
  }

  Future authorize(
      {required String username,
      String? extension,
      required String password}) async {
    var uri = Uri.https(server, 'restapi/oauth/token');
    var basicAuth =
        'Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}';
    var r = await http.post(uri, body: {
      'grant_type': 'password',
      'username': username,
      'extension': extension,
      'password': password,
    }, headers: {
      'authorization': basicAuth
    });
    tokenInfo = json.decode(r.body);
    return r;
  }

  Future get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var uri = Uri.https(server, endpoint, queryParameters);
    var r = http.get(uri,
        headers: {'authorization': 'Bearer ${tokenInfo['access_token']}'});
    return r;
  }
}
