library humps.test;

import 'package:humps/humps.dart';
import 'package:test/test.dart';

void main() {
  group('Humps:', () {
    final Map<String, String> decamels = <String, String>{
      'fooBar': 'foo_bar',
      'fooBarBaz': 'foo_bar_baz',
      'foobar': 'foobar',
      'mySQL': 'my_sql',
      'userVIPStatus': 'user_vip_status',
      'userID': 'user_id'
    };

    test('decamelize', () {
      for (String k in decamels.keys) {
        final String result = humps.decamelize(k);
        expect(result, decamels[k]);
      }
    });

    final Map<String, String> camels = <String, String>{
      'foo_bar': 'fooBar',
      'foobar': 'foobar',
      'my_sql': 'mySql',
      'my_sql_repository': 'mySqlRepository',
    };

    test('camelize', () {
      for (String k in camels.keys) {
        final String result = humps.camelize(k);
        expect(result, camels[k]);
      }
    });

    test('decamelizeKeys', () {
      final Map<String, dynamic> result = humps.decamelizeKeys(decamels);
      expect(result.keys, equals(decamels.values));
    });

    test('camelizeKeys', () {
      final Map<String, dynamic> result = humps.camelizeKeys(camels);
      expect(result.keys, equals(camels.values));
    });
  });
}
