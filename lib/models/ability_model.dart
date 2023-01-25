// To parse this JSON data, do
//
//     final abilityModel = abilityModelFromJson(jsonString);

import 'dart:convert';

AbilityModel abilityModelFromJson(String str) => AbilityModel.fromJson(json.decode(str));

String abilityModelToJson(AbilityModel data) => json.encode(data.toJson());

class AbilityModel {
    AbilityModel({
        this.effectChanges,
        this.effectEntries,
        this.flavorTextEntries,
        this.generation,
        this.id,
        this.isMainSeries,
        this.name,
        this.names,
        this.pokemon,
    });

    List<EffectChange>? effectChanges;
    List<AbilityModelEffectEntry>? effectEntries;
    List<FlavorTextEntry>? flavorTextEntries;
    Generation? generation;
    int? id;
    bool? isMainSeries;
    String? name;
    List<Name>? names;
    List<Pokemon>? pokemon;

    factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        effectChanges: json["effect_changes"] == null ? [] : List<EffectChange>.from(json["effect_changes"]!.map((x) => EffectChange.fromJson(x))),
        effectEntries: json["effect_entries"] == null ? [] : List<AbilityModelEffectEntry>.from(json["effect_entries"]!.map((x) => AbilityModelEffectEntry.fromJson(x))),
        flavorTextEntries: json["flavor_text_entries"] == null ? [] : List<FlavorTextEntry>.from(json["flavor_text_entries"]!.map((x) => FlavorTextEntry.fromJson(x))),
        generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: json["names"] == null ? [] : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        pokemon: json["pokemon"] == null ? [] : List<Pokemon>.from(json["pokemon"]!.map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "effect_changes": effectChanges == null ? [] : List<dynamic>.from(effectChanges!.map((x) => x.toJson())),
        "effect_entries": effectEntries == null ? [] : List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "flavor_text_entries": flavorTextEntries == null ? [] : List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "generation": generation?.toJson(),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
        "pokemon": pokemon == null ? [] : List<dynamic>.from(pokemon!.map((x) => x.toJson())),
    };
}

class EffectChange {
    EffectChange({
        this.effectEntries,
        this.versionGroup,
    });

    List<EffectChangeEffectEntry>? effectEntries;
    Generation? versionGroup;

    factory EffectChange.fromJson(Map<String, dynamic> json) => EffectChange(
        effectEntries: json["effect_entries"] == null ? [] : List<EffectChangeEffectEntry>.from(json["effect_entries"]!.map((x) => EffectChangeEffectEntry.fromJson(x))),
        versionGroup: json["version_group"] == null ? null : Generation.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "effect_entries": effectEntries == null ? [] : List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "version_group": versionGroup?.toJson(),
    };
}

class EffectChangeEffectEntry {
    EffectChangeEffectEntry({
        this.effect,
        this.language,
    });

    String? effect;
    Generation? language;

    factory EffectChangeEffectEntry.fromJson(Map<String, dynamic> json) => EffectChangeEffectEntry(
        effect: json["effect"],
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
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

class AbilityModelEffectEntry {
    AbilityModelEffectEntry({
        this.effect,
        this.language,
        this.shortEffect,
    });

    String? effect;
    Generation? language;
    String? shortEffect;

    factory AbilityModelEffectEntry.fromJson(Map<String, dynamic> json) => AbilityModelEffectEntry(
        effect: json["effect"],
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        shortEffect: json["short_effect"],
    );

    Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
        "short_effect": shortEffect,
    };
}

class FlavorTextEntry {
    FlavorTextEntry({
        this.flavorText,
        this.language,
        this.versionGroup,
    });

    String? flavorText;
    Generation? language;
    Generation? versionGroup;

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        versionGroup: json["version_group"] == null ? null : Generation.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version_group": versionGroup?.toJson(),
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
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
    };
}

class Pokemon {
    Pokemon({
        this.isHidden,
        this.pokemon,
        this.slot,
    });

    bool? isHidden;
    Generation? pokemon;
    int? slot;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"],
        pokemon: json["pokemon"] == null ? null : Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "pokemon": pokemon?.toJson(),
        "slot": slot,
    };
}
