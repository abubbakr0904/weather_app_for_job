import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/main/main_bloc.dart';
import 'package:weather_app/service/cache_service/cache_service.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool darkMode = false;

  getData() {
    BlocProvider.of<MainBloc>(context).add(GetCountryEvent());
  }

  @override
  void initState() {
    darkMode = CacheService.getBool("dark_mode");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : AppColors.c47BFDF,
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is GetCountrySuccessState) {
            return Column(
              children: [
                ...List.generate(state.data.length, (index) {
                  return ListTile(
                    title: Text(
                      state.data[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  );
                },)
              ],
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(
                  color: Colors.white
              ),
            );
          }
        },
      ),
    );
  }
}
