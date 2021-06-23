import 'package:either_dart/either.dart';
import 'package:flutter_mobx_graphql/datasources/spotify_api_datasource.dart';
import 'package:flutter_mobx_graphql/errors/exceptions.dart';
import 'package:flutter_mobx_graphql/errors/failures.dart';
import 'package:flutter_mobx_graphql/models/models.dart';
import 'package:flutter_mobx_graphql/repositories/spotify_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSpotifyApiDataSource extends Mock implements ISpotifyApiDataSource {}

void main() {
  late MockSpotifyApiDataSource _dataSource;
  late SpotifyApiRepository _repository;

  setUp(() {
    _dataSource = MockSpotifyApiDataSource();
    _repository = SpotifyApiRepository(_dataSource);
  });

  group('getArtists', () {
    test('should RETURN [Failure] when the data source throws an [Exception]',
        () async {
      // Arrange
      final name = 'Carpenters';
      when(_dataSource.getArtists(name)).thenAnswer(
        (_) async => throw NoResultsFoundException(),
      );

      // Act
      final response = await _repository.getArtists(name);

      // Assert
      expect(response, isA<Left<Failure, List<Artist>>>());
      expect(response.isLeft, true);
      expect(response.isRight, false);
    });

    test(
        'should RETURN [List<Artist>] when the data source returns the results from the server',
        () async {
      // Arrange
      final name = 'Carpenters';
      final result = [
        Artist(
          id: 'xxx1',
          name: 'The Carpenters',
          image: 'img/xxx.png',
        ),
        Artist(
          id: 'xxx2',
          name: 'Carpenters',
          image: 'img/xxx.png',
        ),
      ];
      when(_dataSource.getArtists(name)).thenAnswer((_) async => result);

      // Act
      final response = await _repository.getArtists(name);

      // Assert
      expect(response, isA<Right<Failure, List<Artist>>>());
      expect(response.isLeft, false);
      expect(response.isRight, true);
    });
  });
}
