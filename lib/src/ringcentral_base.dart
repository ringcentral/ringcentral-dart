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

  get basicAuth {
    return 'Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}';
  }

  Future authorize(
      {required String username,
      String? extension,
      required String password}) async {
    var uri = Uri.https(server, '/restapi/oauth/token');
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

  Future revoke({String? tokenToRevoke}) async {
    var uri = Uri.https(server, '/restapi/oauth/revoke');
    var r = await http.post(uri, body: {
      'token': tokenToRevoke ??
          tokenInfo['access_token'] ??
          tokenInfo['refresh_token'],
    }, headers: {
      'authorization': basicAuth
    });
    return r;
  }

  Future refresh({String? refreshToken}) async {
    var tokenToRefresh = refreshToken ?? tokenInfo['refresh_token'];
    var uri = Uri.https(server, '/restapi/oauth/token');
    var r = await http.post(uri, body: {
      'grant_type': 'refresh_token',
      'refresh_token': tokenToRefresh,
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

  Future post({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) {
    var uri = Uri.https(server, endpoint, queryParameters);
    var r = http.post(uri,
        body: body,
        headers: {'authorization': 'Bearer ${tokenInfo['access_token']}'});
    return r;
  }

  Future put({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) {
    var uri = Uri.https(server, endpoint, queryParameters);
    var r = http.put(uri,
        body: body,
        headers: {'authorization': 'Bearer ${tokenInfo['access_token']}'});
    return r;
  }

  Future patch({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) {
    var uri = Uri.https(server, endpoint, queryParameters);
    var r = http.patch(uri,
        body: body,
        headers: {'authorization': 'Bearer ${tokenInfo['access_token']}'});
    return r;
  }

  Future delete({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) {
    var uri = Uri.https(server, endpoint, queryParameters);
    var r = http.delete(uri,
        body: body,
        headers: {'authorization': 'Bearer ${tokenInfo['access_token']}'});
    return r;
  }
}
