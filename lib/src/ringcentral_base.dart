import 'dart:convert';

import 'package:http/http.dart' as http;

class RingCentral {
  String server;
  String clientId;
  String clientSecret;

  RingCentral(this.server, this.clientId, this.clientSecret) {
    if (server.startsWith('https://')) {
      server = server.substring(8);
    }
  }

  Future authorize(username, extension, password) async {
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
    return r;
  }
}
