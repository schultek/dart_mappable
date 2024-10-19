// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polymorph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AnimalAToJson(AnimalA instance) => <String, dynamic>{
      'name': instance.name,
    };

CatA _$CatAFromJson(Map<String, dynamic> json) => CatA(
      json['name'] as String,
      json['color'] as String,
    );

Map<String, dynamic> _$CatAToJson(CatA instance) => <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };

DogA _$DogAFromJson(Map<String, dynamic> json) => DogA(
      json['name'] as String,
      (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$DogAToJson(DogA instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
