import 'package:flutter/material.dart';

import '../constants/actor.dart' as const_actor;
import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../models/actor.dart';

class SmallActorCard extends StatelessWidget {
  const SmallActorCard({
    super.key,
    required this.actor,
  });

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final name = actor.name ?? const_app.unknownStr;
    final character = actor.character ?? const_app.unknownStr;
    final cover = actor.cover;

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
            const_routes.actorInfo,
            arguments: {
              const_actor.actor: actor,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: const_measures.smallHorMargin,
            vertical: const_measures.smallVerMargin,
          ),
          child: Column(
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
                              child: Icon(Icons.person_outline),
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
                        child: Icon(Icons.person_outline),
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: const_measures.smallVerMargin,
                  ),
                  child: Column(
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        character,
                        style: theme.textTheme.subtitle1?.copyWith(
                          color: theme.focusColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
