import 'package:weather_app/data/model/http_result/http_result.dart';
import 'package:weather_app/data/provider/api_provider/api_provider.dart';

class MainProvider extends ApiProvider {
  ///get all groups
  Future<HttpResult> getData() async {
    return await getRequest('');
  }

  ///get country
  Future<HttpResult> getCountry() async {
    return await getRequest('https://restcountries.com/v3.1/all');
  }
}