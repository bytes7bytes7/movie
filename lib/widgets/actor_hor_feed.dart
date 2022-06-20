import 'package:flutter/material.dart';

import '../constants/actor.dart' as const_actor;
import '../constants/common.dart' as const_common;
import '../constants/measures.dart' as const_measures;
import '../models/actor.dart';
import 'carousel_feed.dart';
import 'small_actor_card.dart';

class ActorHorFeed extends StatelessWidget {
  const ActorHorFeed({
    super.key,
    required this.title,
    required this.query,
    required this.moveID,
  });

  final String title;
  final String query;
  final String moveID;

  @override
  Widget build(BuildContext context) {
    final actors = List.generate(
      5,
      (index) => Actor.fromJson({
        const_actor.id: '123',
        const_actor.name: 'Аскар Ильясов',
        const_actor.character: 'Кирсан Аюшев',
        const_actor.cover:
            'https://kinopoisk-ru.clstorage.net/1id70b085/957d86sGCdrV/XTZ9P68iEhPhs67W8gLHaxQT2RNmaEEumDCC8bmBNOij5ez5o2fFav6CUD_tfBsQ8HOVNdK-h2YwNY4_x_0e8Gw2eMsLkofWACIu41c384qh091nwu0170kFVzRLcjZrgXLOmlHlx6zqlgROGImO5PFmNbSHDzZ3dxZfT2LZiBZPBS9eyXBDAAfAvOeRQ5TdZ5H5Z-WLUTl5wpLDWJC0SwGALXpD93dfCdcUOOlobnWgJFdW1zu0xgVHC30yeprXDLbdL4thgEK2AN22AQI17RZC6kX0KgKoC9KAIBgwpeqR4BzaMvanLIqGd4tY2S11cITkZjbIR6cGVImfw-tpVl9ULx7J0VMSBaBcBVMiVG-2APhFt7gwOqjSYjFaUIZJQcAuuSI1dd0aZ4fYiMl_JVDW9ffVq-bEpNQLjZPJ6wU-hnxuy7JBUsZRTWSBMYQ8VhEIBPUpgnkbwUJyamJEmYLR7erwViX8itVHq-gJXiYy15X3dsumFWY3uO5yKOgnPrTOzjijgPPV0A5kYsOW3vTD2gc3SZNrC9BwsNnzhEjR4Jz5MwUVLws2NXioi61Wk3fn5UQbpkeEZglscoko5b93bv66QZKRhCBu9mHSJayUYUvE1TlDyQogAwAZs1S64hMMy0L0JGw4hfZJeLgtZwFG9mXXqpdkZNTqzYJbO5ecZK5dyUPiEgfDD7TgkiYvVmAqxSTqARsK4PEz6yPWKpBDX-kjJ1efOWQXyChYb1bBFeS25CnFp1XmOt8zyUok7vdtfLnyMODmAI_1kRLH3FfDOVb1OvDLWJBwYMuB5XqDgd7a4tdWbPj15dpKGk7UYUX1lPbZl-TX9ThO4JjpR21lLT8K4EDAd9DtZgLwps014qrWxijiiJhRI4GpwGdo4zNu-FI3hBy6ZcWaCaveh0FUdedU6Te2hXcLDpOI2wUsRT9dCvChICWCzrZBYhdtJjK6BLZaQPj6Q0NDyDDmKXJD7SuDBMdtCxc1qWgKbqWDxKfEJyrURASFCb_QyymkLMQcf9pgoTPnom708PD1jRVhSge0ejLZ2PDSQxqxJ0jwcDwoIzU2Tsk0Zamq-W93YzVHNWSY5mTXxAgMUmrpNz4mnS_b8gAxhhEednPj5J6GscnENUsgyUgjcuJY01QoseGeGkM0p8y7pjcpimluJMI2R0bUiOYEBYU5f5Jo-KbetT6eyoLhUfTxrIbj06Rcd9LY5dTZYHnpoWNSeYK06bMyTLlTVJReySbmGfi7TUUDFEVH13mXBgY1-y5R-atWfuddLotAErJFs5wmQWP2LvRAiMcEWqEJKvGCMxqx5FqSEezLEtQlz5qmR4vraAw2srQHZOT7BtW2FcvdgMs6Fx9X_p8I4FMTtwFv5VPS5HyGkLkEpLrSqVngwyHJ8WTL8dEOGPJHBY4pNAdbizm8xtHn5TWEuNfVdJXZ_TCZi8Quxo5cyfLz0hVhT2RAY8WMhLMa9RSIkDgokwKQetFEGNPhnAsg50V_O3QHyNjIDMYQlvdGpYjXx2d0KW6iitvX7lcuD4uwsJK3AX6EsFCGjwVTKOe0KsDoyxFi0-ozRItiQE9Lw7TWXTtHBHpJOz5Wkeb3pWcItiVldfoekrqa1B4m_A-pIBNxRkNu9VEA5r6kYPh0hlhzSBvzgqGaQeT6ojGsCbI39B8rVdfYCmt-VsB0FHVFW7XVt7TZfbIIaDYOtiyeWyDhM5XSbrZz0Bbc9VEYJ8T6YjnLs3KwyfEGmqExDhjQVjacu2YUmalabkUCBFX295q3FAf1u3zyWfjF30Y_jQtA4SDEMBwlERPWLMZxCEbneuBImkOyM8uhFDkiwp5LESSnj4p3h6gI2o-mQFQ1B1copQaUxpsfwnurJy42nR77YKETdaLsB0Bh9k10s3lG1YhC-erQ43M4stYrcAIP6mLktj8pNtfK2PvMdkI2lAWnWnYFd_VJrlHpm8ZeFe8N6rIi4_YA3FVDEIf85aMqpTY5sEnqwYKhiyHU62EgLqtB9xRuWHQFysmr_jWQ5AQkpUsEF7ZGua_ie1kljUdOf5iT0PBFcU1VI1PEbzeBWpbGezDZG7EiI7nApPkxoE17YjV1TGkV9Jtbu51nEXYEFwTrhCQEFXruc3tpRc9UT4-ZkfJxVmBtVqHDlq2248pkpxoCesjTILMYAadJEPFfC8L21J5btNfLu3he94Elx5TlSbWHpefa34C66cRMZH6P2NIgMXWDXGZCMHfe5lIYlgRIs2qYYRIySQFFO2HDLEpxpBcNiSflC9k4n3SA1NXFJ-qHxmRUOdxgyYvHzhaPjIiSE_IHIhwmcyJ1jyaDKjblanIa6vIgwYvT1dmj88yrs_fWf0vV5cgIiz6VcjfkZJcKtBck1uss8-jZlm9EnH35c7ECZBIvpOIix2-Xgfh1ZMrSqOnC0CMokGfbQDB_6HI05D2Zl-Z5-IgvpKD25AcFGpeUVaT4H2Obaqf8tT8fC-IC88bSfFVjY5WOVjApJoZI4_r7gbODGDK3e2ETLQgDFeQdeqRkOls5DaRBxma2F4mmBIXFyl6wORgVLlSufftAIULHkRwmoWL1TaYSGXUlO5DpKBDi8RuA1UtTg74b4UUEfzh2FwipK-1Hc1dUtuaLdhb1hzo-w9hJNc0kvs_ZYgNCVyE9VTHDhU2EkaqVhRsCOvpQI7OIIMXqkDNN-mNVFF7Zl9UI6CusR6P1RIdFS5R2laWJ_xCYq0cO9rzu-uBRwLcTPldxcvafJDM5R8VZIotaQpNyCSO0q4ATnEgjFqesS6b3u9sILxcz9OfExPnENUTHOA6gewqVPyaMXkljUSKUYWwk8nBGbNWy2NU0esD7eeAC0mih9zjDwBzoUwenbKilJHh5O1ynY-T3xxTbtQWGR1pf0nkbJ-73PM0KQbLw56KO1HMgdh_WcAl1h4hAGNjQcHBqo3aIwfH_aOAVlc2Ip-ZpmSpvd1Ik5efFm0eUA',
        const_actor.bigCover:
            'https://kinopoisk-ru.clstorage.net/1id70b085/957d869zuIq0/edKY7oqi0xLEcwomwgOiDmTjaBfHnPCKGcTiYRnFFMkDsc1pg-aFitt3pSqIbesRlSOgYOIvIgMhYP5fwpmvYGlDbEpOgpJnsYIbwwcmQ2-Rc9gy1j1lei0FduRtpMX8pmQ_moFlpx35FFeoiqv_dXESJZUnWyZW1HSb-xPYmEa4dvw-2GHBIZYSbHSTEER9dtILVpQqgwg5sGGCCdL1OxODLHgDRSfvGvRFujpYHDRhZNR0x8p3FLaWy8-RaeoX7ESsncqggpJkYy5lUFL1vReDmxc1GvLbKpJwI1pDhysBYGzYEuS3jytUNLvqK59lAtdlxYTKp7QFpio8YgjpBG6mXQw5IdFwllJs1YMCRh2WMMk3VJhSmTiSM7Fo0SQr43EuuDFHZ68ZNyR4ONoPhPKEtdXWmofmFDfJX8NrS4TstA0uu3KwosUibraRQoXsh1EbJITLsojI03Eg2pKXOMMyHorzl6S-2mT2G2j7nzYy99UV95nl53Q3aj-DuolnX9fsz7hQsJB3gp2nUOOWbcRR-NaWKRBaGtCzQMuAhynx8K0bM0b3j6t3NUhYKB7VQCSVlwTpREcGJVjvg-hrNu5V7G54kjFT17IfRUKBx52kw_vHJVtw-IsTUTAbIobZgkBtW-O0xHw7RUS5aWstZoMVRaSE2NZ2F6XLXrLLi4QN9By8a-ASQBcRbEcyAkR-xYF6hybYsvnqEqDjWfCGGXBzn8thJLYsaGclahqYLIdilBVExukWJQV2-N3gCLq23eatLhpTYNPUMBz24PClvUXACwfHK7Na-YFxM6gg1GnxIL9pUnSl7ulU5Joba-0WkIZ3BudrtnUUVOotsks4pd93fn-5MONBlHOv5JDQNG0nU5jlpjrRe2oBQiG6YxSoosHdKNBmxVxZdlR6yRuvhrDGNLd3OJZklCdIHRIZaifsNw1vi3KiYYYRr_RxMGY_BIPbdxeawqt60zJTGBN2usIDvNhRJ1Qs2qWFSYpqHvRA9VUWxxpU9EYEO97x6-vV7oZOLHnTouClM39kcSOkH6TBauX1evH4itAwc2oyVAlTA25ZkEbWHwumJXh7SdzXEPWX5cbItAWm9Xhsw8s4lO81zI25QLACJGN-9tAhxazUQ-n25GliKAkTsUJ4IsTa86IsO-Mml46plEV56suuRUJ1t3XHmxUGpobIfMOr6tXeRgyPqNFQkYfSb4YxQbdMZrN5xqSrk0sYMlDQOJJlWOISDWoD55VdezdVGdlZ3MWTRcWn5PrUJKSHy42yqellHBfPHvsh8MPkYi5EwqIGDlYT23b22RDZSBCAU_nipggDc25ZU1S0fttFFJloyI9FMtfWdKWJZYTmpPgPI3pZRSzkHixqYJFzR9Ot5IMD9Lyl0MnH5ItiCXnTILOKQtUZQmG9GdPF1745lvQKSIk813IHtiUVeQbXBPWYTPJ6m8U-xK5-27Og4jcQbPYjwlbchVHadsV7YCraIpCByNOkaoPQDjnzFvWOq4Umqgh4LpdylOXUpXnHphaGuXzyaIgkzlc8bYugYHOXQy60YIL0vLSxKkWGeOHK6DAwI5gDR-jjk57b84VEL3jFxfmbWi6kcSZ0J5fpRtYWZXv8k4qKJR0nDF3Ko5ACRUMMJMNhBf6kwMsV5klA-TijAlEro5cKA-HuqVP0hF6bh7R6uRg-tqKEN3fX6RdE9bVZr5B6WOQ-RCzvOEGAkpXS_iQxI9ZvpIPpxRYrEcjY8EDzOtJHSvPwvRmxlIdeOZbWG3ubroVhxZRGx_rVNLQ2626Su-ilXEVsvqiyUWKGwa5EMTCHjdYQiwbW2yLoyJFjc7ijFrozc79JozcEranFF2nqiJ-U8vQ1xiYZl2TUx0vcgKl7lnwmXJz7UKASJFJeZHEDNh8mMtp09rqQKrmRUYEaEmYpYjNMWmElVm04ZGSp-zg81aKW5edlyZUGdcW7rlOqmKWul88Oy7HQMVZBT7by87W9FmDZBYcLATrqcrIw6KJmOAPh_8lj5UdPGSVHullpTZdwlvS3V4pH1OXkub8huFkWXpZ8nAlSA2P3Mz2XAOAGzIdguUbEmNMYmkFCcmgyl0ijY80oE_cXz3r1ZHg4S3z2gcdmpzTYxkbl1xgfoYvrRZ3X7Zw5MkFw9sM8lSJhFd2nYzvWllpSegqzIxNakUQqofNs6RBHNp5ohcS7mZlOV6KXhmT3SFYVJlT5vZAoSrc95h5dubPCQMfDfdbwITY-llPYJXcpAsvYQYBB64EUmJNyPenyNUesG8R36VoKnMSQV-QkNstX5DQFOx6iaYsE3uX-LtuwQDI2wC2Ww-JEn9YT6Td1eMIa6uFhYyrxZguhgf87YteFnPsltbqbeF42kJQ1l5cqpQcFpIv-kbjLhgwVbQ-J4eFgJTFcd2ESJ6_lkXg3x5hzGDii4MOKQ2U7UWNceNDVZl9IZnR5qTqMdJMlxZSGG3fGBccZ7rI7uvQfJv18OtBykYZTrubS44VvtmD5dpV5sqnp8QJBuxF3eDLDbNoAdUd8GoYFWKkab0cRZmYlpBuW9od2C32Dq2qVLWcu3khioHAXMV5E8VKELNYTO3f1ukKL2aKhMsgCpOljsW9oYkV17ImV5whJeC2VYlSUN0T4pGe1dvp_U7ka190HXT8ZQkMAB4N8ZtNSFJz3YKvWhbpgCGpCARJa0XapovP8yHLktlx6dGUYWVnMdKBU1TcF-HTFpUdZv7HZevVuxo5_-zCA0gWiX-SB0PSu9GLrZ_ZowKr5kEFQemDWuxIyfcsDpaZ8q8YlW-qrXkWC5-YUhqjkxAYE2A3hmquX3zc-nFrisQI1EuxngTLX3KYRaGVGmzErGAKwc5gQ9RmDkhxJQDblrytmVUrqa71GUSREJ_UYtNQWBwgvkKppF71mTJ5LUGDThYGvRWLgpB9E4ek1dugy6cmiA4EY81Qp8TAeS8GG557I5uZY2MqdRJM1pDbGyIUUA',
      }),
    );

    // TODO: uncomment
    // return CarouselFeed(
    //   title: title,
    //   child: Query(
    //     options: QueryOptions(
    //       document: gql(query),
    //     ),
    //     builder: (result, {refetch, fetchMore}) {
    //       if (result.data == null) {
    //         return const LinearProgressIndicator();
    //       }
    //
    //       final actors = <Actor>[];
    //
    //       try {
    //         actors.addAll(_parse(result.data));
    //       } catch (e) {
    //         SpreadQuillManager.inst.error(e);
    //       }
    //
    //       if (actors.isEmpty) {
    //         return const Text('Пусто');
    //       }
    //
    //       return ListView.builder(
    //         physics: const BouncingScrollPhysics(),
    //         scrollDirection: Axis.horizontal,
    //         itemCount: actors.length,
    //         itemExtent: const_measures.smallMovieCardWidth +
    //             2 * const_measures.smallHorMargin +
    //             2 * const_measures.bigHorMargin,
    //         itemBuilder: (context, index) {
    //           return SmallActorCard(
    //             actor: actors[index],
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );

    return CarouselFeed(
      title: title,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemExtent: const_measures.smallMovieCardWidth +
            2 * const_measures.smallHorMargin +
            2 * const_measures.bigHorMargin,
        itemBuilder: (context, index) {
          return SmallActorCard(
            actor: actors[index],
          );
        },
      ),
    );
  }

  Iterable<Actor> _parse(Map<String, Object?>? data) {
    return ((data?[const_actor.actors] as Map)[const_common.edges] as List).map(
      (e) => Actor.fromJson(
        (e as Map)[const_common.node] as Map<String, Object?>,
      ),
    );
  }
}
