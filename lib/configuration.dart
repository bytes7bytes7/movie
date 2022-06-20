import 'package:graphql_flutter/graphql_flutter.dart';

import 'constants/secret.dart' as const_secret;

GraphQLClient graphQLClient() {
  final httpLink = HttpLink(
    const_secret.url,
    defaultHeaders: {
      'X-Parse-Application-Id': const_secret.parseApplicationId,
      'X-Parse-Client-Key': const_secret.parseClientKey,
      'X-Parse-Master-Key': const_secret.parseMasterKey,
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: httpLink,
  );
}
