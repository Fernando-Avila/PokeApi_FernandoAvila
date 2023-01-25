part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailShowAbilityEvent extends DetailEvent {
  final String? url;
  DetailShowAbilityEvent({required this.url});
}

class DetailShowTypeEvent extends DetailEvent {
  final String? url;
  DetailShowTypeEvent({required this.url});
}

class DetailInitialEvent extends DetailEvent {
  DetailInitialEvent();
}
