part of app;

PageRoute<T> onGenerateRoute<T>(RouteSettings settings) {
  if (settings.name == SearchScreen.routeName) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(),
    );
  } else if (settings.name == ArtistsScreen.routeName) {
    final args = settings.arguments as ArtistsScreenArgs;

    return MaterialPageRoute(
      builder: (_) => ArtistsScreen(
        name: args.name,
      ),
    );
  } else {
    return MaterialPageRoute(
      builder: (_) => Container(
        child: Text("No route found"),
      ),
    );
  }
}
