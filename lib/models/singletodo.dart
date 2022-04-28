import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singletodo.g.dart';

@JsonSerializable()
class Singletodo {
  int userId;
  String title;
  int id;
  bool completed;

  Singletodo(
      {required this.title,
      required this.userId,
      required this.completed,
      required this.id});
  factory Singletodo.fromJson(Map<String, dynamic> json) =>
      _$SingletodoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SingletodoToJson(this);
}
