part of common;

abstract class ISpotifyApiDataSource {
  Future<List<Artist>> getArtists(String name);
}

class SpotifyApiDataSource implements ISpotifyApiDataSource {
  SpotifyApiDataSource(this._client);

  final GraphQLClient _client;

  @override
  Future<List<Artist>> getArtists(String name) async {
    try {
      const String query = r'''
        query getArtists($name: String!) {
            queryArtists(byName: $name) {
                name
                id
                image
                albums {
                  id
                  name
                }
            }
        }
      ''';

      final response = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: {
            'name': name,
          },
        ),
      );

      final exception = response.exception;
      if (exception != null) {
        throw exception;
      }

      final data = response.data;
      if (data != null) {
        return Data.fromJson(data).queryArtists;
      } else {
        throw NoResultsFoundFailure();
      }
    } catch (e) {
      throw e;
    }
  }
}
