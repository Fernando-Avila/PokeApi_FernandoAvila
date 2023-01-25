part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final AbilityModel? ability;
  final TypeModel? type;
  factory DetailState.initial() => DetailInitial();

  DetailState({this.ability, this.type});

  DetailState copyWith({AbilityModel? ability, TypeModel? type}) =>
      DetailState(ability: ability ?? this.ability, type: type ?? this.type);
  @override
  List<Object?> get props => [ability, type];
}

class DetailInitial extends DetailState {
  DetailInitial() : super(ability: null, type: null);
}
