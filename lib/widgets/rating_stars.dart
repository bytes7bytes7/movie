// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;

const _fullStarValue = const_app.maxRatingValue / const_app.ratingStarsAmount;
const _halfStarValue = _fullStarValue / 2;

extension _DoubleExt on double {
  double get positiveValue {
    if (this < 0) {
      return 0;
    }

    return this;
  }
}

enum _StarType {
  full,
  half,
  empty,
}

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        const_app.ratingStarsAmount,
        (index) {
          final value = (rating - _fullStarValue * index).positiveValue;
          return _RatingStar(
            type: (value >= _fullStarValue)
                ? _StarType.full
                : (value >= _halfStarValue)
                    ? _StarType.half
                    : _StarType.empty,
          );
        },
      ),
    );
  }
}

class _RatingStar extends StatelessWidget {
  const _RatingStar({super.key, required this.type});

  final _StarType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _StarType.full:
        return const Icon(
          Icons.star,
          size: const_measures.smallIconSize,
        );
      case _StarType.half:
        return const Icon(
          Icons.star_half,
          size: const_measures.smallIconSize,
        );
      case _StarType.empty:
        return const Icon(
          Icons.star_border,
          size: const_measures.smallIconSize,
        );
    }
  }
}
