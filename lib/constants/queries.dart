const get10Best = '''
query get10Best {
  movies(
    where: {
      objectId: {
        in: [
          "65a174LPVe",
          "a1hACo1FuH",
          "uScNcqzQGf",
          "LiEF4GlmEc",
          "1gU91pexWR",
          "LtJ2gdbb5G",
          "zYW2NWYlm0",
          "5qfBOBHlEB",
          "bq9X4No6Zz",
          "wCvKAAW2WC",
        ]
      },
    },
  ) {
    edges {
      node {
        title
        description
        cover
        bigCover
        rating
        genres {
          ... on Element {
            value
          }
        }
      }
    }
  }
}
''';

const getMovies = r'''
query getMovies($first: Int!, $skip: Int!) {
  movies(first: $first, skip: $skip) {
    count
    edges {
      node {
        title
        description
        cover
        bigCover
        rating
        genres {
          ... on Element {
            value
          }
        }
      }
    }
  }
}

''';
