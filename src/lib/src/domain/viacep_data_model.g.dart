// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viacep_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViacepDataModelImpl _$$ViacepDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViacepDataModelImpl(
      cep: json['cep'] as String,
      logradouro: json['logradouro'] as String,
      complemento: json['complemento'] as String? ?? "s/ complemento",
      bairro: json['bairro'] as String,
      localidade: json['localidade'] as String,
      uf: json['uf'] as String,
      ibge: json['ibge'] as String? ?? "",
      gia: json['gia'] as String? ?? "",
      ddd: json['ddd'] as String,
      siafi: json['siafi'] as String? ?? "",
    );

Map<String, dynamic> _$$ViacepDataModelImplToJson(
        _$ViacepDataModelImpl instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'ibge': instance.ibge,
      'gia': instance.gia,
      'ddd': instance.ddd,
      'siafi': instance.siafi,
    };
