import 'package:either_dart/either.dart';
import 'package:flutter_mobx_graphql/common/common.dart';
import 'package:flutter_mobx_graphql/feature/artists/artists.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSpotifyApiRepository extends Mock implements ISpotifyApiRepository {}

void main() {
  late MockSpotifyApiRepository _repository;
  late ArtistsStore _store;

  setUp(() {
    _repository = MockSpotifyApiRepository();
    _store = ArtistsStore(_repository);
  });

  group(
    'searchArtists',
    () {
      test(
        'should SET the [errorMessage] when the repository returns a [Failure]',
        () {
          // Arrange
          final name = 'Carpenters';
          when(_repository.getArtists(name)).thenAnswer(
            (_) async => Left(NoResultsFoundFailure()),
          );

          // Act
          _store.searchArtists(name);

          // Assert
          expect(_store.errorMessage, 'No results found.');
        },
      );

      test(
        'should SET the [artistsResult] when the repository returns the results',
        () {
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
          when(_repository.getArtists(name)).thenAnswer(
            (_) async => Right(result),
          );

          // Act
          _store.searchArtists(name);

          // Assert
          expect(_store.artistsResult, result);
          expect(_store.artistsResult!.length, 2);
          expect(_store.artistsResult!.first.name, result.first.name);
        },
      );
    },
  );
}
