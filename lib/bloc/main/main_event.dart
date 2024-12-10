part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

class GetDataEvent extends MainEvent {

  @override
  List<Object?> get props => [];
}

class GetCountryEvent extends MainEvent {

  @override
  List<Object?> get props => [];
}