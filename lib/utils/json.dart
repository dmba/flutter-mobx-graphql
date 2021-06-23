import 'package:json_annotation/json_annotation.dart';

typedef Json = Map<String, dynamic>;

const jsonSerializable = JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
);
