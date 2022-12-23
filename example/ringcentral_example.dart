import 'dart:io';
import 'package:ringcentral/ringcentral.dart';

var env = Platform.environment;

void main() async {
  var rc = RingCentral(
    server: env['RINGCENTRAL_SERVER_URL']!,
    clientId: env['RINGCENTRAL_CLIENT_ID'],
    clientSecret: env['RINGCENTRAL_CLIENT_SECRET'],
  );
  await rc.authorize(
    username: env['RINGCENTRAL_USERNAME']!,
    extension: env['RINGCENTRAL_EXTENSION'],
    password: env['RINGCENTRAL_PASSWORD']!,
  );
  var r = await rc.get(endpoint: '/restapi/v1.0/account/~/extension/~');
  print(r.body);
}
