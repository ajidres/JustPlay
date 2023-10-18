part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeData extends HomeState {

  final List<CityInfo> data;

  HomeData(this.data);

}
