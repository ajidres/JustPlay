import 'dart:convert';
import 'dart:math';

import 'package:justplay/extentions/image_extentions.dart';
import 'package:justplay/features/home/domain/city_info.dart';

import 'package:http/http.dart' as http;
import 'package:justplay/features/home/domain/wheather_info.dart';
import 'package:mock_data/mock_data.dart';

import '../domain/game_info.dart';

class HomeRepository{

  Future<List<CityInfo>> fetchDataCity() async {

    List<CityInfo> dataList = [
      CityInfo('Amsterdan', Images.amsterdan.key, 'lat=52.354637&lon=4.8215608'),
      CityInfo('Chicago', Images.chicago.key, 'lat=41.8336152&lon=-87.8967692'),
      CityInfo('Londres', Images.londres.key, 'lat=51.5286416&lon=-0.1015987'),
      CityInfo('Paris', Images.paris.key, 'lat=48.8588255&lon=2.2646353'),
      CityInfo('Sidney', Images.sidney.key, 'lat=-33.8478053&lon=150.6023382'),
      CityInfo('Tokyo', Images.tokyo.key, 'lat=35.5074466&lon=139.11045'),
    ];



    for(var item in dataList){

      var random = mockInteger(1, 10);

      List<GameInfo> list = List<GameInfo>.generate(random, (index) => getGameInfo());

      item.gameInfo = list;

      var weather = await getForecast(item.location);
      item.weather=weather;
    }


    return dataList;

  }

  Future<Weather> getForecast(String loc) async {
    try {

      String api = 'https://api.openweathermap.org/data/2.5/weather';
      String url = '$api?$loc&appid=a65ffd9cb0191b9705717374b65bb7d7';

      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);

      return Weather.fromJson(json);

    } catch (e) {
      rethrow;
    }
  }

  GameInfo getGameInfo(){

    var random = Random().nextInt(2);
    GameCategory category = GameCategory.values[random];

    random = Random().nextInt(2);
    var field = GameField.values[random];

    DateTime now = DateTime.now();
    var date = mockDate(now, DateTime(now.year, now.month, now.day+5));

    var gamble = Random().nextBool();

    var gambleAmount =0;

    if(gamble) gambleAmount = mockInteger(500, 3000);

    var maxPeople = mockInteger(4,20);

    var enrollPeople = mockInteger(3, maxPeople);

    return GameInfo(category, date, field, gamble, gambleAmount, maxPeople, enrollPeople);

  }

}