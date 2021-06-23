part of app;

PageRoute<T> onGenerateRoute<T>(RouteSettings settings) {
  if (settings.name == SearchScreen.routeName) {
    return MaterialPageRoute(
      builder: (_) => const SearchScreen(),
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
      builder: (_) => const Text("No route found"),
    );
  }
}
