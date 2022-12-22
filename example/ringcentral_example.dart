import 'dart:io';
import 'package:ringcentral/ringcentral.dart';

var env = Platform.environment;

void main() async {
  var rc = RingCentral(
    env['RINGCENTRAL_SERVER_URL'] ?? '',
    env['RINGCENTRAL_CLIENT_ID'] ?? '',
    env['RINGCENTRAL_CLIENT_SECRET'] ?? '',
  );
  var r = await rc.authorize(
    env['RINGCENTRAL_USERNAME'],
    env['RINGCENTRAL_EXTENSION'],
    env['RINGCENTRAL_PASSWORD'],
  );
  print(r.statusCode);
  print(r.body);
}
