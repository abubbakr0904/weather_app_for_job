import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/main/main_bloc.dart';
import 'package:weather_app/data/repository/repo/main_repository.dart';

class AppService{
  static void changePageMain(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepositoryProvider(
          create: (context) => MainRepository(),
          child: BlocProvider(
            create: (context) => MainBloc(
              mainRepository: RepositoryProvider.of<MainRepository>(context),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}