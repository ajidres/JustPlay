import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justplay/style/themes.dart';

import '../extentions/image_extentions.dart';
import '../style/colors.dart';
import '../widgets/app_bar_widget.dart';
import 'home/domain/city_info.dart';
import 'home/domain/game_info.dart';

class GameByCityPage extends StatelessWidget {
  const GameByCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CityInfo;

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Games',
        showBack: true,
      ),
      body: _gameRow(context, args),
    );
  }

  Widget _gameRow(BuildContext context, CityInfo data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ['This are the game in ${data.name}:'.setTextTitleThemeSmall(context), _listGames(context, data)],
        ),
      ),
    );
  }

  Widget _listGames(BuildContext context, CityInfo data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.gameInfo!.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            _imageSportWidget(context, data.gameInfo![index].category, data.weather!.weather!.last.icon!),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _gameTitle(context, data.gameInfo![index].category, data.gameInfo![index].date),
                    _separator(),
                    _gameDetail(context, data.gameInfo![index].field, data.gameInfo![index].category,
                        data.gameInfo![index].enrollPeople, data.gameInfo![index].maxPeople),
                    _separator(),
                    _gamble(context, data.gameInfo![index].gamble, data.gameInfo![index].gambleAmount)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _separator() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget _imageSportWidget(BuildContext context, GameCategory data, String icon) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageSport(data),
            fit: BoxFit.fill,
            height: 100,
            width: 100,
          ),
        ),
        Positioned(
            top: 5,
            child: SizedBox(
              height: 30,
              child: CircleAvatar(
                backgroundColor: AppColorPalette.secondary,
                child: Image.network(
                  'https://openweathermap.org/img/wn/$icon@2x.png',
                ),
              ),
            ))
      ],
    );
  }

  Widget _gameTitle(BuildContext context, GameCategory category, DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [nameSport(context, category), DateFormat.yMMMEd().format(date).setTextThemeMediumBold(context)],
    );
  }

  Widget _gameDetail(BuildContext context, GameField field, GameCategory category, int enrollPeople, int maxPeople) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        fieldSport(context, field),
        Row(
          children: [
            '$enrollPeople/$maxPeople'.setTextThemeMedium(context),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset(
                imageBallSport(category),
                fit: BoxFit.fill,
                height: 15,
                width: 15,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _gamble(BuildContext context, bool canGamble, int gambleAmount) {
    return Visibility(
        visible: canGamble,
        child: Row(
          children: [
            '\$$gambleAmount'.setTextThemeMediumBold(context),
            Image.asset(
              Images.dollar.key,
              fit: BoxFit.fill,
              height: 15,
              width: 15,
            )
          ],
        ));
  }
}

String imageSport(GameCategory category) {
  switch (category) {
    case GameCategory.baseball:
      return Images.baseball.key;
    case GameCategory.soccer:
      return Images.soccer.key;
  }
}

String imageBallSport(GameCategory category) {
  switch (category) {
    case GameCategory.baseball:
      return Images.baseballBall.key;
    case GameCategory.soccer:
      return Images.soccerBall.key;
  }
}

Text nameSport(BuildContext context, GameCategory category) {
  switch (category) {
    case GameCategory.baseball:
      return 'Baseball'.setTextThemeMedium(context);
    case GameCategory.soccer:
      return 'Soccer'.setTextThemeMedium(context);
  }
}

Text fieldSport(BuildContext context, GameField field) {
  switch (field) {
    case GameField.indoor:
      return 'INDOOR'.setTextThemeMedium(context);
    case GameField.outdoor:
      return 'OUTDORR'.setTextThemeMedium(context);
  }
}
