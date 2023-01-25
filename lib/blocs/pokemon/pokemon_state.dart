part of 'pokemon_bloc.dart';

//generate class PokemonState extends Equatable and copiwith method
class PokemonState extends Equatable {
  final PaginationModel? pagination;
  final PokemonModel? pokemon;
  final List<Abilities>? abilities;
  final List<Stat>? stats;
  final List<Stat>? newstats;
  final ColorScheme? colorScheme;
  factory PokemonState.initial() => PokemonInitial();
  PokemonState(
      {this.pagination,
      this.pokemon,
      this.abilities,
      this.stats,
      this.newstats,
      this.colorScheme});
  PokemonState copyWith(
          {PaginationModel? pagination,
          PokemonModel? pokemon,
          List<Abilities>? abilities,
          List<Stat>? stats,
          List<Stat>? newstats,
          ColorScheme? colorScheme}) =>
      PokemonState(
          pagination: pagination ?? this.pagination,
          pokemon: pokemon ?? this.pokemon,
          abilities: abilities ?? this.abilities,
          stats: stats ?? this.stats,
          newstats: newstats ?? this.newstats,
          colorScheme: colorScheme ?? this.colorScheme);
  @override
  List<Object?> get props =>
      [pagination, pokemon, abilities, stats, newstats, colorScheme];
}

class PokemonResetSelect extends PokemonState {
  final PaginationModel pagination;
  PokemonResetSelect(this.pagination)
      : super(
          pagination: pagination,
          pokemon: null,
          abilities: [],
          stats: [
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'hp', url: '')),
            Stat(
                baseStat: 0, effort: 0, stat: Species(name: 'attack', url: '')),
            Stat(
                baseStat: 0,
                effort: 0,
                stat: Species(name: 'defense', url: '')),
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'speed', url: '')),
          ],
          newstats: [
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'hp', url: '')),
            Stat(
                baseStat: 0, effort: 0, stat: Species(name: 'attack', url: '')),
            Stat(
                baseStat: 0,
                effort: 0,
                stat: Species(name: 'defense', url: '')),
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'speed', url: '')),
          ],
          colorScheme: const ColorScheme.light(
              primary: Color(0xffee1515),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black),
        );
}

class PokemonInitial extends PokemonState {
  PokemonInitial()
      : super(
          pagination: PaginationModel(
              next: 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=3',
              previous: '',
              results: []),
          pokemon: null,
          abilities: [],
          stats: [
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'hp', url: '')),
            Stat(
                baseStat: 0, effort: 0, stat: Species(name: 'attack', url: '')),
            Stat(
                baseStat: 0,
                effort: 0,
                stat: Species(name: 'defense', url: '')),
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'speed', url: '')),
          ],
          newstats: [
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'hp', url: '')),
            Stat(
                baseStat: 0, effort: 0, stat: Species(name: 'attack', url: '')),
            Stat(
                baseStat: 0,
                effort: 0,
                stat: Species(name: 'defense', url: '')),
            Stat(baseStat: 0, effort: 0, stat: Species(name: 'speed', url: '')),
          ],
          colorScheme: const ColorScheme.light(
              primary: Color(0xffee1515),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black),
        );
}

enum Abilities {
  intimidation,
  immunity,
  power,
  regeneration,
  impassive,
  toxic,
}

enum directions {
  next,
  previous,
}
