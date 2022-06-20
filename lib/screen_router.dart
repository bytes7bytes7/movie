// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import 'constants/movie.dart' as const_movie;
import 'constants/routes.dart' as const_routes;
import 'models/movie.dart';
import 'screens/screens.dart';

part 'custom_route_builder.dart';

class ScreenRouter {
  ScreenRouter._();

  static final inst = ScreenRouter._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route navigate(RouteSettings settings) {
    final name = settings.name ?? '';
    final args = <String, Object?>{};
    final rawArgs = settings.arguments;
    if (rawArgs is Map<String, Object?>) {
      args.addAll(rawArgs);
    }

    switch (name) {
      case const_routes.home:
        return _up(const HomeScreen());
      case const_routes.movieInfo:
        final movie = args[const_movie.movie];
        if (movie is Movie) {
          return _left(
            MovieInfoScreen(
              movie: movie,
            ),
          );
        }

        return navigate(
          const RouteSettings(name: ''),
        );
      default:
        SpreadQuillManager.inst.error('Попытка открыть 404 экран');
        return _up(const NotFoundScreen());
    }
  }

  Route _up(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      );

  Route _down(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      );

  Route _left(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      );

  Route _right(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      );
}
