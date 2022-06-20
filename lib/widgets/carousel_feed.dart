import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

class CarouselFeed extends StatelessWidget {
  const CarouselFeed({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: const_measures.bigVerMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: const_measures.bigHorMargin,
            ),
            child: Text(
              title,
              style: theme.textTheme.headline5,
            ),
          ),
          SizedBox(
            height: const_measures.horFeedHeight,
            child: child,
          ),
        ],
      ),
    );
  }
}
