// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxA<T> _$BoxAFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BoxA<T>(
      content: fromJsonT(json['content']),
    );

Map<String, dynamic> _$BoxAToJson<T>(
  BoxA<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'content': toJsonT(instance.content),
    };

ContentA _$ContentAFromJson(Map<String, dynamic> json) => ContentA(
      json['data'] as String,
    );

Map<String, dynamic> _$ContentAToJson(ContentA instance) => <String, dynamic>{
      'data': instance.data,
    };
