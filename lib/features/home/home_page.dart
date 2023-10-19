import 'package:flutter/material.dart';
import 'package:justplay/features/home/bloc/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justplay/style/colors.dart';
import 'package:justplay/style/themes.dart';

import '../../extentions/routes_extentions.dart';
import '../../widgets/app_bar_widget.dart';
import 'domain/city_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      lazy: false,
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: const AppBarWidget(title: 'JustPlay'),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Stack(
        children: [
          if (state is HomeData && state.data.isNotEmpty) _showData(context, state.data),
          if (state is HomeInitial) _loading()
        ],
      );
    });
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColorPalette.secondary,
        ),
      ),
    );
  }

  Widget _showData(BuildContext context, List<CityInfo> data) {
    double latMargin = 8;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(left: latMargin, right: latMargin, top: 20),
        child: Column(
          children: [
            'Select the city where you wan\'t to play'.setTextTitleThemeSmall(context),
            Row(
              children: [
                _cityColumn(context, data.sublist(0, 3)),
                Container(padding: const EdgeInsets.only(top: 30), child: _cityColumn(context, data.sublist(3)))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cityColumn(BuildContext context, List<CityInfo> data) {
    double cardWidth = (MediaQuery.of(context).size.width / 2) - 8;

    return SizedBox(
      width: cardWidth,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => _cityCard(context, cardWidth, data[index]),
      ),
    );
  }

  Widget _cityCard(BuildContext context, double cardWidth, CityInfo data) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: (){
            Routes.gamesByCity.navigate(context, argument: data);
          },
          child: Card(
            elevation: 16,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  data.image,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: AppColorPalette.secondary,
                  child: Image.network(
                    'https://openweathermap.org/img/wn/${data.weather!.weather!.last.icon!}@2x.png',
                    height: 70,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: cardWidth,
                    child: Center(child: data.name.setTextThemeCard(context)),
                  ))
            ]),
          ),
        ));
  }
}
