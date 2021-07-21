class UrlUtil {
  static bool isUrl(String url) {
    return true;
  }

  static String mapToParameter(Map<String, dynamic> map) {
    List<String> parameters = [];
    map.forEach((key, value) => parameters.add('$key=$value'));
    return parameters.join('&');
  }
}
