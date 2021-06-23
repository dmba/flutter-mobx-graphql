part of common;

typedef Json = Map<String, dynamic>;

const jsonSerializable = JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
);
