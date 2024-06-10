import 'package:selecao_app/src/utils/config.dart';

class ViacepApiRoutes {
  static const String _baseApiUrl = Config.viacepEndpoint;

  static String zipcodeUrl(String zipcode) => "$_baseApiUrl/$zipcode/json/";
}
