import 'package:json_annotation/json_annotation.dart';


part 'base_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseData<T> {
  final int? code;
  final String? message;
  final T? data;

  T get requireData => data!;

  BaseData({this.code, this.message, this.data});

  bool get isSuccess => code == 0 || code == 1;

  factory BaseData.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$BaseDataFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseDataToJson<T>(this, toJsonT);
}
