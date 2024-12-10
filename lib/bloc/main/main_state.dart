part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();
}

final class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class GetDataSuccessState extends MainState {
  final WeatherModel data;
  const GetDataSuccessState({required this.data});

  @override
  List<Object> get props => [];
}

class GetCountrySuccessState extends MainState {
  final List<Country> data;
  const GetCountrySuccessState({required this.data});

  @override
  List<Object> get props => [];
}


final class ErrorState extends MainState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends MainState {
  @override
  List<Object> get props => [];
}

final class NetworkState extends MainState {
  @override
  List<Object> get props => [];
}

