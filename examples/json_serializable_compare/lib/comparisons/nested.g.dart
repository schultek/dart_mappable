// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameA _$GameAFromJson(Map<String, dynamic> json) => GameA(
      player: PlayerA.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameAToJson(GameA instance) => <String, dynamic>{
      'player': instance.player.toJson(),
    };

PlayerA _$PlayerAFromJson(Map<String, dynamic> json) => PlayerA(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlayerAToJson(PlayerA instance) => <String, dynamic>{
      'name': instance.name,
    };
