import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/data/model/country_model/country_model.dart';
import 'package:weather_app/data/model/http_result/http_result.dart';
import 'package:weather_app/data/model/weather_model/wetaher_model.dart';
import 'package:weather_app/data/repository/repo/main_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository mainRepository;

  MainBloc({required this.mainRepository}) : super(MainInitial()) {
    on<GetDataEvent>(
      (event, emit) async {
        emit(LoadingState());
        bool networkResult = await InternetConnectionChecker().hasConnection;
        if (!networkResult) {
          emit(NetworkState());
        } else {
          HttpResult response = await mainRepository.getData();
          if (response.isSuccess) {
            WeatherModel weatherModel = WeatherModel.fromJson(response.result);
            emit(GetDataSuccessState(data: weatherModel));
          } else {
            try {
              emit(ErrorState());
            } catch (_) {
              emit(ErrorState());
            }
          }
        }
      }
    );

    on<GetCountryEvent>(
            (event, emit) async {
          emit(LoadingState());
          bool networkResult = await InternetConnectionChecker().hasConnection;
          if (!networkResult) {
            emit(NetworkState());
          } else {
            HttpResult response = await mainRepository.getCountry();
            if (response.isSuccess) {
              List<dynamic> data = json.decode(response.result);
              List<Country> country = data.map((country) => Country.fromJson(country)).toList();
              emit(GetCountrySuccessState(data: country));
            } else {
              try {
                emit(ErrorState());
              } catch (_) {
                emit(ErrorState());
              }
            }
          }
        }
    );
  }
}
