part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonEventInit extends PokemonEvent {
  final PaginationModel? pagination;
  PokemonEventInit({required this.pagination});
}

class PokemonChangePageEvent extends PokemonEvent {
  final directions direction;
  PokemonChangePageEvent({required this.direction});
}

class PokemonSelectEvent extends PokemonEvent {
  final PokemonModel? pokemon;
  const PokemonSelectEvent({required this.pokemon});
}

class PokemonSelectHabilityEvent extends PokemonEvent {
  final Abilities? ability;
  const PokemonSelectHabilityEvent({required this.ability});
}
