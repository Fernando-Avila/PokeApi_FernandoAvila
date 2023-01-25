import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokeapi_fernando_avila_bloc/models/ability_model.dart';
import 'package:pokeapi_fernando_avila_bloc/models/type_model.dart';
import 'package:pokeapi_fernando_avila_bloc/repository/pokeservice.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {
      //  emit(DetailInitial());
    });
    on<DetailInitialEvent>((event, emit) {
      emit(DetailInitial());
    });
    on<DetailShowAbilityEvent>((event, emit) async {
      emit(
          state.copyWith(ability: await PokemonService.getAbility(event.url!)));
    });
    on<DetailShowTypeEvent>((event, emit) async {
      emit(state.copyWith(type: await PokemonService.getType(event.url!)));
    });
  }
}
