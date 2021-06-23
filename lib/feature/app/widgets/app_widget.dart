part of app;

class AppWidget extends StatefulWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  late HttpLink _httpLink;
  late GraphQLClient _client;
  late ISpotifyApiDataSource _spotifyApiDataSource;
  late ISpotifyApiRepository _spotifyApiRepository;

  @override
  void initState() {
    _httpLink = HttpLink(
      'https://spotify-graphql-server.herokuapp.com/graphql',
    );

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );

    _spotifyApiDataSource = SpotifyApiDataSource(_client);
    _spotifyApiRepository = SpotifyApiRepository(_spotifyApiDataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ArtistsStore(_spotifyApiRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme.copyWith(
                  headline2: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyText1: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ).copyWith(),
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: SearchScreen.routeName,
      ),
    );
  }
}
