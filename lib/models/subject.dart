import 'package:json_annotation/json_annotation.dart';

part "subject.g.dart";

@JsonSerializable()
class Subject {
  Subject(this.id, this.name);

  int id;
  String name;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
