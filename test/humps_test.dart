library humps.test;

import 'package:test/test.dart';
import 'package:humps/humps.dart';

void main() {
  group('Humps:', () {
    Map decamels = {
      "fooBar": "foo_bar",
      "fooBarBaz": "foo_bar_baz",
      "foobar": "foobar",
      "mySQL": "my_sql",
      "userVIPStatus": "user_vip_status",
      "userID": "user_id"
    };

    test('decamelize', () {
      for (var k in decamels.keys) {
        var result = humps.decamelize(k);
        expect(result, decamels[k]);
      }
    });

    Map camels = {
      "foo_bar": "fooBar",
      "foobar": "foobar",
      "my_sql": "mySql",
      "my_sql_repository": "mySqlRepository",
    };

    test('camelize', () {
      for (var k in camels.keys) {
        var result = humps.camelize(k);
        expect(result, camels[k]);
      }
    });

    test('decamelizeKeys', () {
      var result = humps.decamelizeKeys(decamels);
      expect(result.keys, equals(decamels.values));
    });

    test('camelizeKeys', () {
      var result = humps.camelizeKeys(camels);
      expect(result.keys, equals(camels.values));
    });
  });
}
