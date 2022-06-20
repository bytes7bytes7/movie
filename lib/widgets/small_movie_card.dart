import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../constants/movie.dart' as const_movie;
import '../constants/routes.dart' as const_routes;
import '../models/movie.dart';
import 'rating_stars.dart';

class SmallMovieCard extends StatelessWidget {
  const SmallMovieCard({
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

    return Container(
      height: const_measures.smallMovieCardHeight,
      width: const_measures.smallMovieCardWidth,
      margin: const EdgeInsets.symmetric(
        vertical: const_measures.bigVerMargin,
        horizontal: const_measures.bigHorMargin,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: const_measures.smallHorMargin,
            vertical: const_measures.smallVerMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: const_measures.smallMoviePicHeight,
                width: const_measures.smallMovieCardWidth,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
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
                              fallbackHeight:
                                  const_measures.smallMovieCardHeight,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: const_measures.smallVerMargin,
                  ),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingStars(
                    rating: rating,
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
            ],
          ),
        ),
      ),
    );
  }
}
