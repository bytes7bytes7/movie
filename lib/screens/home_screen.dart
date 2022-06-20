import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/common.dart' as const_common;
import '../constants/measures.dart' as const_measures;
import '../constants/movie.dart' as const_movie;
import '../constants/queries.dart' as queries;
import '../models/movie.dart';
import '../widgets/widgets.dart';

const _moviesPerReq = 5;
const _additionalElms = 2;
const _throttleDuration = Duration(seconds: 2);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  late final StreamController _streamController;
  final _movies = <Movie>[];
  final _result = <String, dynamic>{};

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          SpreadQuillManager.inst.log('_movies.length = ${_movies.length}');
          _streamController.sink.add(null);
        }
      });
    _streamController = StreamController()
      ..stream.throttleTime(_throttleDuration).listen((_) {
        _loadMore();
      })
      ..sink.add(null);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _streamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(queries.getMovies),
          variables: {
            const_movie.first: _moviesPerReq,
            const_movie.skip: _movies.length,
          },
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.data != null) {
            _result
              ..clear()
              ..addAll(result.data ?? {});
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: _movies.length + _additionalElms,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const MovieHorFeed(
                  title: 'Популярные',
                  query: queries.get10Best,
                );
              } else if (index == 1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: const_measures.bigHorMargin,
                  ),
                  child: Text(
                    'Новое',
                    style: theme.textTheme.headline5,
                  ),
                );
              }

              return BigMovieCard(
                movie: _movies[index - _additionalElms],
              );
            },
          );
        },
      ),
    );
  }

  void _loadMore() {
    setState(() {
      if (_result.isNotEmpty) {
        try {
          final newMovies = _parseMovies(_result);
          SpreadQuillManager.inst.log('newMovies.length: ${newMovies.length}');
          _movies.addAll(newMovies);
        } catch (e) {
          SpreadQuillManager.inst.error(e);
        }
      }
    });
  }

  Iterable<Movie> _parseMovies(Map<String, Object?>? data) {
    return ((data?[const_movie.movies] as Map)[const_common.edges] as List).map(
      (e) => Movie.fromJson(
        (e as Map)[const_common.node] as Map<String, Object?>,
      ),
    );
  }
}
