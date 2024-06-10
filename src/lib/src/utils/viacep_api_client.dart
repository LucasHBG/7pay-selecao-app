import 'package:http/http.dart' as http;
import 'config.dart';

class ViacepApiClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();
  final String _baseUrl = Config.viacepEndpoint;

  ViacepApiClient();

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Uri url(String path, [Map<String, String?>? queryParameters]) {
    return Uri.parse('$_baseUrl$path')
        .replace(queryParameters: queryParameters);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(requestHeaders);
    return _httpClient.send(request);
  }
}
