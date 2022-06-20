import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../models/movie.dart';
import '../widgets/widgets.dart';

const _topOffset = SizedBox(height: 400);
const _bottomOffset = SizedBox(height: 30);
const _ratingOffset = SizedBox(width: 10);

class MovieInfoScreen extends StatelessWidget {
  const MovieInfoScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = movie.title ?? const_app.unknownStr;
    final description = movie.description ?? '';
    final bigCover = movie.bigCover;
    final rating = movie.rating ?? const_app.unknownRating;
    final genres = movie.genres ?? [];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              image: bigCover != null
                  ? DecorationImage(
                      image: NetworkImage(bigCover),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                    )
                  : null,
            ),
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.black,
                  Colors.black12,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _topOffset,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: const_measures.bigHorMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: const_measures.bigVerMargin,
                      ),
                      child: Row(
                        children: [
                          RatingStars(
                            rating: rating,
                          ),
                          _ratingOffset,
                          Text('$rating'),
                        ],
                      ),
                    ),
                    Wrap(
                      runAlignment: WrapAlignment.start,
                      spacing: const_app.wrapSpacing,
                      children: List.generate(
                        genres.length,
                        (index) {
                          return Chip(
                            label: Text(
                              genres[index],
                              style: theme.textTheme.subtitle2,
                            ),
                            backgroundColor: theme.shadowColor,
                            visualDensity: VisualDensity.compact,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: const_measures.bigVerMargin,
                      ),
                      child: Text(
                        'Описание',
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Text(
                      description,
                      style: theme.textTheme.bodyText2,
                    ),
                    _bottomOffset,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
