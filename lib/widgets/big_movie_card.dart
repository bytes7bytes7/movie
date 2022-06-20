import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../constants/movie.dart' as const_movie;
import '../constants/routes.dart' as const_routes;
import '../models/movie.dart';
import 'widgets.dart';

const _ratingSpacing = 5.0;

class BigMovieCard extends StatelessWidget {
  const BigMovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = movie.title ?? const_app.unknownStr;
    final cover = movie.cover;
    final rating = movie.rating ?? const_app.unknownRating;
    final genres = movie.genres ?? [];

    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(
        horizontal: const_measures.bigHorMargin,
        vertical: const_measures.bigVerMargin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(const_measures.borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(const_measures.borderRadius),
        onTap: () {
          Navigator.of(context).pushNamed(
            const_routes.movieInfo,
            arguments: {
              const_movie.movie: movie,
            },
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: const_measures.smallMovieCardWidth,
              margin: const EdgeInsets.only(
                right: const_measures.bigHorMargin,
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    const_measures.borderRadius,
                  ),
                ),
              ),
              child: cover != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          const_measures.borderRadius,
                        ),
                      ),
                      child: Image.network(
                        cover,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loading) {
                          if (loading == null) {
                            return child;
                          }

                          return const Placeholder(
                            fallbackHeight: const_measures.smallMovieCardHeight,
                            child: Icon(Icons.movie_creation_outlined),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Expanded(
                            child: Icon(Icons.error_outline),
                          );
                        },
                      ),
                    )
                  : const Expanded(
                      child: Icon(Icons.movie_creation_outlined),
                    ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: const_measures.bigVerMargin,
                    ),
                    child: Text(
                      title,
                      style: theme.textTheme.bodyText1,
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
                      vertical: const_measures.smallVerMargin,
                    ),
                    child: Row(
                      children: [
                        RatingStars(
                          rating: rating,
                        ),
                        const SizedBox(
                          width: _ratingSpacing,
                        ),
                        Flexible(
                          child: Text(
                            rating.toStringAsFixed(
                              const_app.ratingReminderLength,
                            ),
                            style: theme.textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
