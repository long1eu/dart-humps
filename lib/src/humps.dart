/// Top-level constant provides access to the API of this library.
const Humps humps = const Humps._();

class Humps {
  const Humps._();

  /// Convert keys of given map from `camelCase` to `underscores`.
  ///
  /// This function is recursive meaning it will convert keys of nested maps
  /// if present.
  Map<String, dynamic> decamelizeKeys(Map<String, dynamic> map) {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (String key in map.keys) {
      dynamic value = map[key];
      if (value is Map<String, dynamic>) {
        value = decamelizeKeys(value);
      }
      result[decamelize(key)] = value;
    }
    return result;
  }

  /// Converts given string from `camelCase` to underscore.
  ///
  /// This function will attempt to detect sequences of uppercase characters
  /// and separate them in a smart way. E.g.:
  ///
  ///     userId => user_id
  ///     userID => user_id
  ///     userVIPStatus => user_vip_status.
  String decamelize(String key) {
    final RegExp regex = new RegExp(r'([A-Z]+)');

    String r = key.replaceAllMapped(regex, (Match m) {
      final String s = m.group(0);
      if (s.length > 1 && !key.endsWith(s)) {
        final String s1 = s.substring(0, s.length - 1).toLowerCase();
        final String s2 = s.substring(s.length - 1, s.length).toLowerCase();
        return '_${s1}_$s2';
      } else {
        return '_' + s.toLowerCase();
      }
    });
    if (r.startsWith('_')) {
      r = r.replaceFirst('_', '');
    }

    return r;
  }

  /// Converts keys of given map from `underscores` to `camelCase`.
  ///
  /// This function is recursive meaning it will convert keys of nested maps
  /// if present.
  Map<String, dynamic> camelizeKeys(Map<String, dynamic> map) {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (String key in map.keys) {
      dynamic value = map[key];
      if (value is Map<String, dynamic>) {
        value = camelizeKeys(value);
      }
      result[camelize(key)] = value;
    }
    return result;
  }

  /// Converts given string from `underscores` to `camelCase`.
  String camelize(String key) {
    final RegExp regex = new RegExp(r'[_]+(.)');

    return key.replaceAllMapped(regex, (Match m) {
      return m.group(1).toUpperCase();
    });
  }
}
