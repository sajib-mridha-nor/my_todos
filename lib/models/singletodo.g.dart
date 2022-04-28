// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singletodo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Singletodo _$SingletodoFromJson(Map<String, dynamic> json) => Singletodo(
      title: json['title'] as String,
      userId: json['userId'] as int,
      completed: json['completed'] as bool,
      id: json['id'] as int,
    );

Map<String, dynamic> _$SingletodoToJson(Singletodo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'id': instance.id,
      'completed': instance.completed,
    };
