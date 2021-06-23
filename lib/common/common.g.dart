// GENERATED CODE - DO NOT MODIFY BY HAND

part of common;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchArtists _$SearchArtistsFromJson(Map<String, dynamic> json) {
  return SearchArtists(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchArtistsToJson(SearchArtists instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    queryArtists: (json['queryArtists'] as List<dynamic>)
        .map((e) => Artist.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'queryArtists': instance.queryArtists.map((e) => e.toJson()).toList(),
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    id: json['id'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    albums: (json['albums'] as List<dynamic>?)
        ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'image': instance.image,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('albums', instance.albums?.map((e) => e.toJson()).toList());
  return val;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    id: json['id'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
