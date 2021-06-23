library common;

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart' hide JsonSerializable;
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';
part 'datasources/spotify_api_datasource.dart';
part 'errors/exceptions.dart';
part 'errors/failures.dart';
part 'models/models.dart';
part 'models/states.dart';
part 'repositories/spotify_api_repository.dart';
part 'utils/json.dart';
