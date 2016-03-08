# Humps

Convert `camelCase` to `underscore_separated` and vice versa.

Converting to underscores supports following use cases:

```
userId => user_id
userID => user_id
userVIPStatus => user_vip_status
```

E.g. the algorithm tries to be smart in detecting sequences of uppercase
letters and separating them.

Converting to camelCase is more straightforward, however it is important to
note that if you take input `A`, decamelize it to `B` and camelize `B` again
it is not guaranteed that you'd get `A` as a result.

Examples of camelization for outputs from above:

```
user_id => userId
user_vip_status => userVipStatus
```

## Usage:

```dart
import 'package:humps/humps.dart';

void main() {
  // Using on strings:
  var a = "userId";
  var b = humps.decamelize(a); // "user_id"
  var c = humps.camelize(b); // "userId"

  // Using on maps:
  var mapA = {
    "id": 1,
    "firstName": "Burt",
    "lastName": "Macklin",
    "profile": {"zipCode": 11111},
  };
  var mapB = humps.decamelizeKeys(mapA); // this is recursive:
  // {
  //   "id": 1,
  //   "first_name": "Burt",
  //   "last_name": "Macklin",
  //   "profile": {"zip_code": 11111},
  // }
  var mapC = humps.camelizeKeys(mapB); // will be the same as mapA
}
```

## Inspiration

API of this library takes inspiration from NodeJS `humps` package.

## License

BSD-2
