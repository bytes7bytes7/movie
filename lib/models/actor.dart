import '../constants/actor.dart' as const_actor;

class Actor {
  final String? id;
  final String? name;
  final String? character;
  final String? cover;
  final String? bigCover;

  Actor.fromJson(Map<String, dynamic> json)
      : id = json[const_actor.id],
        name = json[const_actor.name],
        character = json[const_actor.character],
        cover = json[const_actor.cover],
        bigCover = json[const_actor.bigCover];
}
