// features/example_feature/data/models/example_model.dart
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entites/example_entity.dart';

part 'example_model.g.dart';

@JsonSerializable()
class ExampleModel extends ExampleEntity {
  ExampleModel({required super.message});

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
}
