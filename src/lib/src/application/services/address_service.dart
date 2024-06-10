import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:retry/retry.dart';
import 'package:selecao_app/src/domain/viacep_data_model.dart';
import 'package:selecao_app/src/utils/viacep_api_client.dart';
import 'package:selecao_app/src/utils/viacep_api_routes.dart';

class AddressService {
  final ViacepApiClient _viacepApi = ViacepApiClient();

  static const _retryOptions = RetryOptions(maxAttempts: 3);
  static const _retryDuration = Duration(seconds: 10);

  Future<ViacepDataModel> searchZipcode(String text) async {
    try {
      if (text.isEmpty || text.length <= 8) throw "CEP inválido.";

      final String digitsOnly = text.replaceAll(RegExp(r"[\D]"), "");
      final result = await _retryOptions.retry(
          () => sendZipcodeToViacepAPI(digitsOnly).timeout(_retryDuration),
          retryIf: (e) => e is SocketException || e is TimeoutException);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ViacepDataModel> sendZipcodeToViacepAPI(String zipcode) async {
    try {
      final Response response = await _viacepApi.get(
        Uri.parse(ViacepApiRoutes.zipcodeUrl(zipcode)),
      );

      if (response.statusCode >= 500) {
        throw "Erro no servidor. Tente mais tarde ou entre em contato com o suporte.";
      }

      final Map<String, Object?> parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (parsedJson["erro"] == true) {
          throw "CEP não encontrado.";
        }
      }

      return ViacepDataModel.fromJson(parsedJson);
    } on ClientException catch (e) {
      throw "Erro no client: ${e.message}";
    } catch (e) {
      rethrow;
    }
  }
}
