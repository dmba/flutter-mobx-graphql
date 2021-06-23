part of artists;

class ArtistsList extends StatelessWidget {
  final List<Artist> artists;

  const ArtistsList({
    Key? key,
    required this.artists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 32,
      ),
      shrinkWrap: true,
      itemCount: artists.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _ArtistsListItem(
          artist: artists[index],
        );
      },
    );
  }
}

class _ArtistsListItem extends StatelessWidget {
  final Artist artist;

  const _ArtistsListItem({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albums = artist.albums;

    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 56,
            width: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: artist.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade800,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    artist.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    albums != null ? "${albums.length} albums" : "No album",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
