import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ошибка'),
      ),
      body: Center(
        child: Text(
          'Где это мы? 😳',
          style: theme.textTheme.bodyText1,
        ),
      ),
    );
  }
}
