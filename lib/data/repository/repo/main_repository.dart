import 'package:weather_app/data/model/http_result/http_result.dart';
import 'package:weather_app/data/provider/main/main_provider.dart';
import 'package:weather_app/data/repository/abstrac/main_abstrac.dart';

class MainRepository implements AbstractMainRepository {
  final mainProvider = MainProvider();

  @override
  Future<HttpResult> getData() async {
    return await mainProvider.getData();
  }

  @override
  Future<HttpResult> getCountry() async {
    return await mainProvider.getCountry();
  }
}