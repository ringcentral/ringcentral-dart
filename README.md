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
// init
const rc = RingCentral('<server>', '[clientId]', '[clientSecret]');

// authorize
await rc.authorize('<username>',' [extension]', '<password>');

// make API call
var r = await rc.get('/restapi/v1.0/account/~/extension/~');
print(r);
```


## Additional information

This library is current in beta. Please evaluate the risk before using it in production.


## For contributors

### How to test

```
dart test
```
