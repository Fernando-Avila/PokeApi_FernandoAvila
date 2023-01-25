import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi_fernando_avila_bloc/models/pagination_model.dart';
import 'package:pokeapi_fernando_avila_bloc/models/pokemon_model.dart';
import 'package:pokeapi_fernando_avila_bloc/repository/pokeservice.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  ScrollController scrollController = ScrollController();
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonChangePageEvent>((event, emit) async {
      emit(PokemonResetSelect(await PokemonService.getPagination(
          event.direction == directions.next
              ? state.pagination!.next
              : state.pagination!.previous)));
    });
    on<PokemonSelectEvent>(_pokemonselect);
    on<PokemonSelectHabilityEvent>(_pokemonselectability);
  }

  void init() async {
    add(PokemonChangePageEvent(direction: directions.next));
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        scrollController.animateTo(scrollController.position.minScrollExtent,
            curve: Curves.ease, duration: Duration(milliseconds: 100));
        scrollController.jumpTo(scrollController.position.minScrollExtent);
        add(PokemonChangePageEvent(direction: directions.next));
      }
    });
  }

  List<Stat> selectstats(PokemonModel _pokemon) {
    List<Stat> stats = [];
    stats.add(_pokemon.stats![0]);
    stats.add(_pokemon.stats![1]);
    stats.add(_pokemon.stats![4]);
    stats.add(_pokemon.stats![5]);
    return stats;
  }

  Future<void> _changepase(
      PokemonChangePageEvent event, Emitter<PokemonState> emit) async {
    emit(state.copyWith());
  }

  Future<void> _pokemonselect(
      PokemonSelectEvent event, Emitter<PokemonState> emit) async {
    emit(state.copyWith(
        pokemon: event.pokemon,
        stats: selectstats(event.pokemon!),
        abilities: [],
        newstats: selectstats(event.pokemon!),
        colorScheme: design(event.pokemon!.types![0].type!.name!)));
  }

  Future<void> _pokemonselectability(
      PokemonSelectHabilityEvent event, Emitter<PokemonState> emit) async {
    final list = [...state.abilities!];
    if (list.contains(event.ability!)) {
      list.remove(event.ability!);
    } else {
      if (list.length < 2) {
        list.add(event.ability!);
      }
    }
    if (state.pokemon != null) {
      emit(state.copyWith(
        abilities: list,
        newstats: _updateAbilities(
          list,
        ),
      ));
    }
  }

  List<Stat> _updateAbilities(
    List<Abilities> _abilities,
  ) {
    final newstats = [
      Stat(
          baseStat: state.stats![0].baseStat,
          effort: state.stats![0].effort,
          stat: state.stats![0].stat),
      Stat(
          baseStat: state.stats![1].baseStat,
          effort: state.stats![1].effort,
          stat: state.stats![1].stat),
      Stat(
          baseStat: state.stats![2].baseStat,
          effort: state.stats![2].effort,
          stat: state.stats![2].stat),
      Stat(
          baseStat: state.stats![3].baseStat,
          effort: state.stats![3].effort,
          stat: state.stats![3].stat)
    ];
    for (var abilitie in _abilities) {
      switch (abilitie) {
        case Abilities.intimidation:
          newstats[0].baseStat = newstats[0].baseStat! - 5;
          newstats[1].baseStat = newstats[1].baseStat! + 10;
          newstats[2].baseStat = newstats[2].baseStat! - 10;
          newstats[3].baseStat = newstats[3].baseStat! + 15;
          break;
        case Abilities.immunity:
          newstats[0].baseStat = newstats[0].baseStat! + 10;
          newstats[1].baseStat = newstats[1].baseStat! - 20;
          newstats[2].baseStat = newstats[2].baseStat! + 20;
          newstats[3].baseStat = newstats[3].baseStat! - 10;

          break;
        case Abilities.power:
          newstats[0].baseStat = newstats[0].baseStat! - 20;
          newstats[1].baseStat = newstats[1].baseStat! + 15;
          newstats[2].baseStat = newstats[2].baseStat! - 10;
          newstats[3].baseStat = newstats[3].baseStat! + 15;
          break;
        case Abilities.regeneration:
          newstats[0].baseStat = newstats[0].baseStat! + 10;
          newstats[1].baseStat = newstats[1].baseStat! - 20;
          newstats[2].baseStat = newstats[2].baseStat! + 5;
          newstats[3].baseStat = newstats[3].baseStat! + 5;
          break;
        case Abilities.impassive:
          newstats[0].baseStat = newstats[0].baseStat! - 10;
          newstats[1].baseStat = newstats[1].baseStat! - 3;
          newstats[2].baseStat = newstats[2].baseStat! - 10;
          newstats[3].baseStat = newstats[3].baseStat! + 30;
          break;
        case Abilities.toxic:
          newstats[0].baseStat = newstats[0].baseStat! - 15;
          newstats[1].baseStat = newstats[1].baseStat! + 0;
          newstats[2].baseStat = newstats[2].baseStat! + 20;
          newstats[3].baseStat = newstats[3].baseStat! - 3;
          break;
        default:
      }
    }
    return newstats;
  }
}
