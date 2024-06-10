import 'package:freezed_annotation/freezed_annotation.dart';

part 'viacep_data_model.freezed.dart';
part 'viacep_data_model.g.dart';

@freezed
class ViacepDataModel with _$ViacepDataModel {
  const factory ViacepDataModel({
    required String cep,
    required String logradouro,
    @Default("s/ complemento") String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    @Default("") String ibge,
    @Default("") String gia,
    required String ddd,
    @Default("") String siafi,
  }) = _ViacepDataModel;

  factory ViacepDataModel.fromJson(Map<String, Object?> json) =>
      _$ViacepDataModelFromJson(json);
}
