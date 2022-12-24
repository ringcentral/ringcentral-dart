# RingCentral Dart SDK. 

It provides utility classes/functions for you to access RingCentral Restful API.


## Features

- Authorization
- HTTP GET/POST/PUT/PATCH


## Getting started

Add `ringcentral` to your pubspec.yaml file:

```yaml
dependencies:
  ringcentral: <latest_version>
```

Import it:

```dart
import 'package:ringcentral/ringcentral.dart';
```


## Usage

```dart
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
```


## Additional information

This library is current in beta. Please evaluate the risk before using it in production.


## For contributors

### How to test

```
dart test
```
