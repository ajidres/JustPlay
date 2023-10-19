import 'package:bloc/bloc.dart';
import 'package:justplay/features/home/data/home_repository.dart';
import 'package:meta/meta.dart';

import '../domain/city_info.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    fetchCities();
  }


  void fetchCities() async{

    List<CityInfo> data = await HomeRepository().fetchDataCity();

    emit(HomeData(data));

  }
}
