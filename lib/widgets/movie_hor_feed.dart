import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import '../constants/common.dart' as const_common;
import '../constants/measures.dart' as const_measures;
import '../constants/movie.dart' as const_movie;
import '../models/movie.dart';
import 'carousel_feed.dart';
import 'small_movie_card.dart';

class MovieHorFeed extends StatelessWidget {
  const MovieHorFeed({
    super.key,
    required this.title,
    required this.query,
  });

  final String title;
  final String query;

  @override
  Widget build(BuildContext context) {
    return CarouselFeed(
      title: title,
      child: Query(
        options: QueryOptions(
          document: gql(query),
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.data == null) {
            return const LinearProgressIndicator();
          }

          final movies = <Movie>[];

          try {
            movies.addAll(_parse(result.data));
          } catch (e) {
            SpreadQuillManager.inst.error(e);
          }

          if (movies.isEmpty) {
            return const Text('Пусто');
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemExtent: const_measures.smallMovieCardWidth +
                2 * const_measures.smallHorMargin +
                2 * const_measures.bigHorMargin,
            itemBuilder: (context, index) {
              return SmallMovieCard(
                movie: movies[index],
              );
            },
          );
        },
      ),
    );
  }

  Iterable<Movie> _parse(Map<String, Object?>? data) {
    return ((data?[const_movie.movies] as Map)[const_common.edges] as List).map(
      (e) => Movie.fromJson(
        (e as Map)[const_common.node] as Map<String, Object?>,
      ),
    );
  }
}
