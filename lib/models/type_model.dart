// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

TypeModel typeModelFromJson(String str) => TypeModel.fromJson(json.decode(str));

String typeModelToJson(TypeModel data) => json.encode(data.toJson());

class TypeModel {
  TypeModel({
    this.damageRelations,
    this.gameIndices,
    this.generation,
    this.id,
    this.moveDamageClass,
    this.moves,
    this.name,
    this.names,
    this.pastDamageRelations,
    this.pokemon,
  });

  DamageRelations? damageRelations;
  List<GameIndex>? gameIndices;
  Generation? generation;
  int? id;
  Generation? moveDamageClass;
  List<Generation>? moves;
  String? name;
  List<Name>? names;
  List<dynamic>? pastDamageRelations;
  List<Pokemon>? pokemon;

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        damageRelations: json["damage_relations"] == null
            ? null
            : DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: json["game_indices"] == null
            ? []
            : List<GameIndex>.from(
                json["game_indices"]!.map((x) => GameIndex.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
        id: json["id"],
        moveDamageClass: json["move_damage_class"] == null
            ? null
            : Generation.fromJson(json["move_damage_class"]),
        moves: json["moves"] == null
            ? []
            : List<Generation>.from(
                json["moves"]!.map((x) => Generation.fromJson(x))),
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        pastDamageRelations: json["past_damage_relations"] == null
            ? []
            : List<dynamic>.from(json["past_damage_relations"]!.map((x) => x)),
        pokemon: json["pokemon"] == null
            ? []
            : List<Pokemon>.from(
                json["pokemon"]!.map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "damage_relations": damageRelations?.toJson(),
        "game_indices": gameIndices == null
            ? []
            : List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        "generation": generation?.toJson(),
        "id": id,
        "move_damage_class": moveDamageClass?.toJson(),
        "moves": moves == null
            ? []
            : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "past_damage_relations": pastDamageRelations == null
            ? []
            : List<dynamic>.from(pastDamageRelations!.map((x) => x)),
        "pokemon": pokemon == null
            ? []
            : List<dynamic>.from(pokemon!.map((x) => x.toJson())),
      };
}

class DamageRelations {
  DamageRelations({
    this.doubleDamageFrom,
    this.doubleDamageTo,
    this.halfDamageFrom,
    this.halfDamageTo,
    this.noDamageFrom,
    this.noDamageTo,
  });

  List<Generation>? doubleDamageFrom;
  List<Generation>? doubleDamageTo;
  List<Generation>? halfDamageFrom;
  List<Generation>? halfDamageTo;
  List<dynamic>? noDamageFrom;
  List<dynamic>? noDamageTo;

  factory DamageRelations.fromJson(Map<String, dynamic> json) =>
      DamageRelations(
        doubleDamageFrom: json["double_damage_from"] == null
            ? []
            : List<Generation>.from(
                json["double_damage_from"]!.map((x) => Generation.fromJson(x))),
        doubleDamageTo: json["double_damage_to"] == null
            ? []
            : List<Generation>.from(
                json["double_damage_to"]!.map((x) => Generation.fromJson(x))),
        halfDamageFrom: json["half_damage_from"] == null
            ? []
            : List<Generation>.from(
                json["half_damage_from"]!.map((x) => Generation.fromJson(x))),
        halfDamageTo: json["half_damage_to"] == null
            ? []
            : List<Generation>.from(
                json["half_damage_to"]!.map((x) => Generation.fromJson(x))),
        noDamageFrom: json["no_damage_from"] == null
            ? []
            : List<dynamic>.from(json["no_damage_from"]!.map((x) => x)),
        noDamageTo: json["no_damage_to"] == null
            ? []
            : List<dynamic>.from(json["no_damage_to"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "double_damage_from": doubleDamageFrom == null
            ? []
            : List<dynamic>.from(doubleDamageFrom!.map((x) => x.toJson())),
        "double_damage_to": doubleDamageTo == null
            ? []
            : List<dynamic>.from(doubleDamageTo!.map((x) => x.toJson())),
        "half_damage_from": halfDamageFrom == null
            ? []
            : List<dynamic>.from(halfDamageFrom!.map((x) => x.toJson())),
        "half_damage_to": halfDamageTo == null
            ? []
            : List<dynamic>.from(halfDamageTo!.map((x) => x.toJson())),
        "no_damage_from": noDamageFrom == null
            ? []
            : List<dynamic>.from(noDamageFrom!.map((x) => x)),
        "no_damage_to": noDamageTo == null
            ? []
            : List<dynamic>.from(noDamageTo!.map((x) => x)),
      };
}

class Generation {
  Generation({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.generation,
  });

  int? gameIndex;
  Generation? generation;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "generation": generation?.toJson(),
      };
}

class Name {
  Name({
    this.language,
    this.name,
  });

  Generation? language;
  String? name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}

class Pokemon {
  Pokemon({
    this.pokemon,
    this.slot,
  });

  Generation? pokemon;
  int? slot;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: json["pokemon"] == null
            ? null
            : Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon?.toJson(),
        "slot": slot,
      };
}
