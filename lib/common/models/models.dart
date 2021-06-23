part of common;

@immutable
@jsonSerializable
class SearchArtists {
  const SearchArtists({
    required this.data,
  });

  factory SearchArtists.fromJson(Json json) => _$SearchArtistsFromJson(json);

  final Data data;

  Json toJson() => _$SearchArtistsToJson(this);
}

@immutable
@jsonSerializable
class Data {
  const Data({
    required this.queryArtists,
  });

  factory Data.fromJson(Json json) => _$DataFromJson(json);

  final List<Artist> queryArtists;

  Json toJson() => _$DataToJson(this);
}

@immutable
@jsonSerializable
class Artist {
  const Artist({
    required this.id,
    required this.name,
    required this.image,
    this.albums,
  });

  factory Artist.fromJson(Json json) => _$ArtistFromJson(json);

  final String id;
  final String name;
  final String image;
  final List<Album>? albums;

  Json toJson() => _$ArtistToJson(this);
}

@immutable
@jsonSerializable
class Album {
  const Album({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Album.fromJson(Json json) => _$AlbumFromJson(json);

  final String id;
  final String name;
  final String image;

  Json toJson() => _$AlbumToJson(this);
}
