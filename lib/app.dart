import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'configuration.dart';
import 'constants/routes.dart' as const_routes;
import 'screen_router.dart';
import 'themes/dark_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ValueNotifier(graphQLClient());

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        navigatorKey: ScreenRouter.inst.navigatorKey,
        onGenerateInitialRoutes: (_) => [
          ScreenRouter.inst.navigate(
            const RouteSettings(name: const_routes.home),
          ),
        ],
        onGenerateRoute: ScreenRouter.inst.navigate,
      ),
    );
  }
}
