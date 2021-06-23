part of common;

abstract class ISpotifyApiRepository {
  Future<Either<Failure, List<Artist>>> getArtists(String name);
}

class SpotifyApiRepository implements ISpotifyApiRepository {
  SpotifyApiRepository(this.dataSource);

  final ISpotifyApiDataSource dataSource;

  @override
  Future<Either<Failure, List<Artist>>> getArtists(String name) async {
    try {
      final data = await dataSource.getArtists(name);
      return Right(data);
    } on OperationException catch (e) {
      return Left(OperationFailure(e.graphqlErrors.first.message));
    } on NoResultsFoundException {
      return Left(NoResultsFoundFailure());
    } on Exception {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnhandledFailure());
    }
  }
}
