import 'package:weather_app/data/model/http_result/http_result.dart';

abstract class AbstractMainRepository {
  Future<HttpResult> getData();

  Future<HttpResult> getCountry();
}